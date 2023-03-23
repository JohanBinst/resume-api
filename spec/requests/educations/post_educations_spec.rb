require 'rails_helper'

RSpec.describe 'Educations', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_resume) { FactoryBot.create(:resume) }
      let!(:my_education) { FactoryBot.create(:education, resume_id: my_resume.id) }

      before do
        post "/api/v1/resumes/#{my_resume.id}/educations", params:
                          { education: {
                            school: my_education.school,
                            degree: my_education.degree,
                            major: my_education.major,
                            start_date: my_education.start_date,
                            end_date: my_education.end_date,
                            location: my_education.location,
                            remote: my_education.remote,
                            country: my_education.country
                          } }
      end

      it 'returns the school' do
        expect(json['school']).to eq(my_education.school)
      end

      it 'returns the degree' do
        expect(json['degree']).to eq(my_education.degree)
      end

      it 'returns the major' do
        expect(json['major']).to eq(my_education.major)
      end

      it 'returns the start_date' do
        expect(json['start_date']).to eq(my_education.start_date.strftime('%Y-%m-%d'))
      end

      it 'returns the end_date' do
        expect(json['end_date']).to eq(my_education.end_date.strftime('%Y-%m-%d'))
      end

      it 'returns the location' do
        expect(json['location']).to eq(my_education.location)
      end

      it 'returns the remote' do
        expect(json['remote']).to eq(my_education.remote)
      end

      it 'returns the country' do
        expect(json['country']).to eq(my_education.country)
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
        post "/api/v1/resumes/#{my_resume.id}/educations", params:
                          { education: {
                            school: nil,
                            degree: nil,
                            major: nil,
                            start_date: nil,
                            end_date: nil,
                            location: nil,
                            remote: nil,
                            country: nil,

                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
