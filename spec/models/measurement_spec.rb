require 'rails_helper'

RSpec.describe Measurement, type: :model do

  describe "mongoid document" do
    it { is_expected.to be_mongoid_document }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:timestamp_day) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:results) }
  end
end
