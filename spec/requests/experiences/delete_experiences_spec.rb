require 'rails_helper'

RSpec.describe 'Experiences', type: :request do
  describe "DELETE /destroy" do
    let!(:my_resume) { FactoryBot.create(:resume) }
    let!(:my_experience) { FactoryBot.create(:experience, resume_id: my_resume.id) }

    before do
      delete "/api/v1/resumes/#{my_resume.id}/experiences/#{my_experience.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
