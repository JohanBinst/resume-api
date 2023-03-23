require 'rails_helper'

RSpec.describe 'Resumes', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_resume) { FactoryBot.create(:resume) }

      before do
        post '/api/v1/resumes', params:
                          { resume: {
                            first_name: my_resume.first_name,
                            last_name: my_resume.last_name,
                            email: my_resume.email,
                            summary: my_resume.summary,
                            job_title: my_resume.job_title,
                            phone: my_resume.phone,
                            soft_skills: my_resume.soft_skills,
                            hard_skills: my_resume.hard_skills
                          } }
      end

      it 'returns the title' do
        expect(json['first_name']).to eq(my_resume.first_name)
      end

      it 'returns the content' do
        expect(json['last_name']).to eq(my_resume.last_name)
      end

      it 'returns the email' do
        expect(json['email']).to eq(my_resume.email)
      end

      it 'returns the summary' do
        expect(json['summary']).to eq(my_resume.summary)
      end

      it 'returns the job_title' do
        expect(json['job_title']).to eq(my_resume.job_title)
      end

      it 'returns the phone' do
        expect(json['phone']).to eq(my_resume.phone)
      end

      it 'returns the soft_skills' do
        expect(json['soft_skills']).to eq(my_resume.soft_skills)
      end

      it 'returns the hard_skills' do
        expect(json['hard_skills']).to eq(my_resume.hard_skills)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/resumes', params:
                          { resume: {
                            first_name: '',
                            last_name: '',
                            email: '',
                            summary: '',
                            job_title: '',
                            phone: '',
                            soft_skills: '',
                            hard_skills: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
