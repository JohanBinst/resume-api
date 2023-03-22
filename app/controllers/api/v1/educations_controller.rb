class Api::V1::EducationsController < ApplicationController
  before_action :set_education, only: [:show, :update, :destroy]

  def index
    @educations = resume.educations
    render json: @educations
  end

  def show
    render json: @education
  end


  def create
    @education = Education.new(education_params)
    if @education.save
      render json: @education, status: :created
    else
      render json: @education.errors, status: :unprocessable_entity
    end
  end

  def update
    if @education.update(education_params)
      render json: @education
    else
      render json: @education.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @education.destroy
    head :no_content
  end

  private

  def set_education
    @education = Education.find(params[:id])
  end

end
