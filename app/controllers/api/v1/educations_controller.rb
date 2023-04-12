class Api::V1::EducationsController < ApplicationController
  before_action :set_education, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    resume = Resume.find(params[:resume_id])
    @educations = resume.educations
    render json: @educations
  end

  def show
    render json: @education
  end


  def create
    @education = Education.new(education_params)
    resume = Resume.find(params[:resume_id])
    @education.resume = resume
    if @education.save && @education.resume.user == current_user
      render json: @education, status: :created
    else
      render json: @education.errors, status: :unprocessable_entity
    end
  end

  def update
    resume = Resume.find(params[:resume_id])
    @education.resume = resume
    if @education.update(education_params) && @education.resume.user == current_user
      render json: @education
    else
      render json: @education.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @education.resume.user == current_user
      @education.destroy
      head :no_content
    else
      render json: @education.errors, status: :unprocessable_entity
    end
  end

  private

  # def set_resume
  #   @resume = Resume.find(params[:resume_id])
  # end

  def education_params
    params.require(:education).permit(:start_date, :end_date, :school, :degree, :major, :location, :remote, :resume_id)
  end

  def set_education
    @education = Education.find(params[:id])
  end

end
