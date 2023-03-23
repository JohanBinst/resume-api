require 'rails_helper'

RSpec.describe 'Resumes', type: :request do
  describe 'GET /index' do
    before do
      # delete previously created resumes if any
      Resume.destroy_all
      FactoryBot.create_list(:resume, 10)
      get '/api/v1/resumes'
    end

    it 'returns all resumes' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
