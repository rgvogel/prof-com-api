class CommentsController < ApplicationController
  before_action :set_professor
  before_action :set_professor_comment, only: [:show, :update, :destroy]
  # GET /professors/:professor_id/comments
  def index
    json_response(@professor.comments)
  end
  # GET /professors/:professor_id/comments/:id
  def show
    json_response(@comment)
  end
  # POST /professors/:professor_id/comments
  def create
    @professor.comments.create!(comment_params)
    json_response(@professor, :created)
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    #p = Professor.find(@professor)

    notifier.ping "New comment about dr.#{@professor.lname}"
  end
  # PUT /professors/:professor_id/comments/:id
  def update
    @comment.update(comment_params)
    head :no_content
  end
  # DELETE /professors/:professor_id/comments/:id
  def destroy
    @comment.destroy
    head :no_content
  end
  private
  def comment_params
    params.permit(:title, :student, :message)
  end
  def set_professor
    @professor = Professor.find(params[:professor_id])
  end
  def set_professor_comment
    @comment = @professor.comments.find_by!(id: params[:id]) if @professor
  end
end
