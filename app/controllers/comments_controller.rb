class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket
  before_action :set_comment, only: [ :edit, :update, :destroy ]

  def index
    @comments = @ticket.comments.includes(:user).order(created_at: :asc)
    unless [ @ticket.creator_id, @ticket.developer_id, @ticket.qa_id ].include?(current_user.id) || current_user.admin?
      redirect_to root_path, alert: "You are not authorized to view these comments."
    end
  end

  def new
    @comment = @ticket.comments.build
  end

  def create
    @comment = @ticket.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      if current_user = "User"
        redirect_to user_dashboard_path, notice: "Comment created successfully."
      else
        redirect_to ticket_comments_path(@ticket), notice: "Comment created successfully."
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to ticket_comments_path(@ticket), notice: "Comment updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to ticket_comments_path(@ticket), notice: "Comment deleted successfully."
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_comment
    @comment = @ticket.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
