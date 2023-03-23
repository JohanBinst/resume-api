require 'rails_helper'

RSpec.describe 'Resumes', type: :request do
  describe "DELETE /destroy" do
    let!(:resume) { FactoryBot.create(:resume) }

    before do
      delete "/api/v1/resumes/#{resume.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
