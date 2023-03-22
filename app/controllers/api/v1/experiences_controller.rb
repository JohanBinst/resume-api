class Api::V1::ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update, :destroy]
  # skip_before_action :verify_authenticity_token

  def index
    @experiences = resume.experiences
    render json: @experiences
  end

  def show
    render json: @experience
  end

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      render json: @experience, status: :created
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  def update
    if @experience.update(experience_params)
      render json: @experience
    else
      render json: @experience.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy
    head :no_content
  end

  private

  def experience_params
    params.require(:experience).permit(:start_date, :end_date, :company, :description, :job_title, :resume_id)
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end

end
