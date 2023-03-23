require 'rails_helper'

RSpec.describe 'Experiences', type: :request do
  # before(:each) { host! 'localhost:3000'}
  describe 'GET /index' do
    let!(:my_resume) { FactoryBot.create(:resume) }

    before do
      FactoryBot.create_list(:experience, 10, resume_id: my_resume.id)
      get "/api/v1/resumes/#{my_resume.id}/experiences"
    end

    it 'returns all experiences' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
