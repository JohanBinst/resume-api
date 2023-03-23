require 'rails_helper'

RSpec.describe 'Educations', type: :request do
  # before(:each) { host! 'localhost:3000'}
  describe 'GET /index' do
    let!(:my_resume) { FactoryBot.create(:resume) }

    before do
      FactoryBot.create_list(:education, 10, resume_id: my_resume.id)
      get "/api/v1/resumes/#{my_resume.id}/educations"
    end

    it 'returns all educations' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
