class Api::V1::ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :update, :destroy]
  # skip_before_action :verify_authenticity_token

  def index
    @resumes = Resume.all
    render json: @resumes
  end

  def show
    @educations = @resume.educations
    @experiences = @resume.experiences
    render json: {resume: @resume, educations: @educations, experiences: @experiences}
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      render json: @resume, status: :created
    else
      render json: @resume.errors, status: :unprocessable_entity
    end
  end

  def update

    if @resume.update(resume_params)
      render json: @resume
    else
      render json: @resume.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @resume.destroy
    head :no_content
  end

  private

  def set_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:first_name, :last_name, :email, :phone, :summary, soft_skills: [], hard_skills: [])
  end
end
