class Api::V1::ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    resume = Resume.find(params[:resume_id])
    @experiences = resume.experiences
    render json: @experiences
  end

  def show
    render json: @experience
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.resume = Resume.find(params[:resume_id])
    if @experience.save && @experience.resume.user == current_user
      render json: @experience, status: :created
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  def update
    @experience.resume = Resume.find(params[:resume_id])
    if @experience.update(experience_params) && @experience.resume.user == current_user
      render json: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @experience.resume.user == current_user
      @experience.destroy
      head :no_content
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:start_date, :end_date, :company, :description, :job_title, :resume_id)
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
