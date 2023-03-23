require 'rails_helper'

RSpec.describe 'Educations', type: :request do
  describe "DELETE /destroy" do
    let!(:my_resume) { FactoryBot.create(:resume) }
    let!(:my_education) { FactoryBot.create(:education, resume_id: my_resume.id) }

    before do
      delete "/api/v1/resumes/#{my_resume.id}/educations/#{my_education.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
