require 'rails_helper'

RSpec.describe Measurement, type: :model do

  describe 'mongoid document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:timestamp_day) }
    it { is_expected.to validate_presence_of(:location) }
  end

  describe '#add_result' do
    let(:measurement) { FactoryBot.create(:measurement, location: 'living_room', results: results) }
    let(:results) { {} }
    let(:params) {{ temperature: '21.1', humidity: '65' }}

    subject { measurement.add_result(params) }

    it 'adds results' do
      Timecop.freeze("2018-01-28 22:12") do
        expect { subject }.to change { measurement.results.size }.from(0).to(1)
        expect(measurement.reload.results['22']['12']['temperature']).to eq('21.1')
        expect(measurement.reload.results['22']['12']['humidity']).to eq('65')
      end
    end

    context 'already existing results' do
      let(:results) do
        {
          '22' => {
            '0' => { 'temperature' => '22.1', 'humidity' => '64.3' },
            '1' => { 'temperature' => '22.3', 'humidity' => '65.1' },
            '2' => { 'temperature' => '21.6', 'humidity' => '62.9' }
          }
        }

        it 'adds results' do
          Timecop.freeze("2018-01-28 22:03") do
            expect { subject }.to change { measurement.results.size }.from(3).to(4)
            expect(measurement.reload.results['22']['3']['temperature']).to eq('21.1')
            expect(measurement.reload.results['22']['3']['humidity']).to eq('65')
          end
        end
      end
    end
  end
end
