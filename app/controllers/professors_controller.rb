class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :update, :destroy]
  # GET /professors
  def index
    @professors = Professor.all
    json_response(@professors)
  end
  # POST /professors
  def create
    @professor = Professor.create!(professor_params)
    json_response(@professor, :created)
  end
  # GET /professors/:id
  def show
    json_response(@professor)
  end
  # PUT /professors/:id
  def update
    @professor.update(professor_params)
    head :no_content
  end
  # DELETE /professors/:id
  def destroy
    @professor.destroy
    head :no_content
  end
  private
  def professor_params
    # whitelist params
    params.permit(:fname, :lname, :subject, :thumbnail, :created_by)
  end
  def set_professor
    @professor = Professor.find(params[:id])
  end
end
