require 'rails_helper'

RSpec.describe 'measurements API', type: :request do
  describe 'POST /measurements' do
    let(:valid_attributes) { { location: 'living_room', temperature: '21.5', humidity: '65' } }

    context 'when the request is valid' do
      before { post '/measurements', params: valid_attributes }

      it 'creates a todo' do
        json = JSON.parse(response.body)
        expect(json['temperature']).to eq('21.5')
        expect(json['humidity']).to eq('65')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
