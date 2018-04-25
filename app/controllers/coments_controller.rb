class ComentsController < ApplicationController
  before_action :set_professor
  before_action :set_professor_coment, only: [:show, :update, :destroy]
  # GET /professors/:professor_id/coments
  def index
    json_response(@professor.coments)
  end
  # GET /professors/:professor_id/coments/:id
  def show
    json_response(@coment)
  end
  # POST /professors/:professor_id/coments
  def create
    @professor.coments.create!(coment_params)
    json_response(@professor, :created)
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    #p = Professor.find(@professor)

    notifier.ping "New comment about dr.#{@professor.lname}"
  end
  # PUT /professors/:professor_id/coments/:id
  def update
    @coment.update(coment_params)
    head :no_content
  end
  # DELETE /professors/:professor_id/coments/:id
  def destroy
    @coment.destroy
    head :no_content
  end
  private
  def coment_params
    params.permit(:title, :student, :message)
  end
  def set_professor
    @professor = Professor.find(params[:professor_id])
  end
  def set_professor_coment
    @coment = @professor.coments.find_by!(id: params[:id]) if @professor
  end
end
