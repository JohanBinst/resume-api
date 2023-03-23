require 'rails_helper'

RSpec.describe 'Experiences', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_resume) { FactoryBot.create(:resume) }
      let!(:my_experience) { FactoryBot.create(:experience, resume_id: my_resume.id) }

      before do
        post "/api/v1/resumes/#{my_resume.id}/experiences", params:
                          { experience: {
                            company: my_experience.company,
                            job_title: my_experience.job_title,
                            start_date: my_experience.start_date,
                            end_date: my_experience.end_date,
                            description: my_experience.description,
                          } }
      end

      it 'returns the company' do
        expect(json['company']).to eq(my_experience.company)
      end

      it 'returns the job_title' do
        expect(json['job_title']).to eq(my_experience.job_title)
      end

      it 'returns the start_date' do
        expect(json['start_date']).to eq(my_experience.start_date.strftime('%Y-%m-%d'))
      end

      it 'returns the end_date' do
        expect(json['end_date']).to eq(my_experience.end_date.strftime('%Y-%m-%d'))
      end

      it 'returns the description' do
        expect(json['description']).to eq(my_experience.description)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns the resume_id' do
        expect(json['resume_id']).to eq(my_resume.id)
      end
    end

    context 'with invalid parameters' do
      let!(:my_resume) { FactoryBot.create(:resume) }
      before do
        post "/api/v1/resumes/#{my_resume.id}/experiences", params:
                          { experience: {
                            company: nil,
                            job_title: nil,
                            start_date: nil,
                            end_date: nil,
                            description: nil,
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
