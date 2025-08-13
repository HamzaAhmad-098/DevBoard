class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [ :show, :edit, :update, :destroy ]

  def index
    case current_user.role
    when "user"
      @tickets = current_user.created_tickets
    when "developer"
      @tickets = current_user.developed_tickets
    when "qa"
      @tickets = current_user.qa_tickets.where(status: :ready_for_qa)
    when "admin"
      @tickets = Ticket.all
    else
      @tickets = []
    end
  end
 def new
    @ticket = Ticket.new
  end
 def create
   @ticket = Ticket.new(ticket_params)
   @ticket.creator = current_user
  if current_user.user?
    @ticket.status = :created
    @ticket.developer_id = nil
    @ticket.qa_id = nil
  end
  if @ticket.save
    redirect_to after_ticket_update_path, notice: "Ticket created successfully."
  else
    render :new, status: :unprocessable_entity
  end
end

def edit; end

def update
  if current_user.admin?
    permitted_params = params.require(:ticket).permit(:title, :description, :status, :developer_id, :qa_id)
  elsif current_user.developer?
    permitted_params = params.require(:ticket).permit(:title, :description, :status, :qa)
  elsif current_user.qa?
    permitted_params = params.require(:ticket).permit(:title, :description, :status)
  else
    permitted_params = params.require(:ticket).permit(:title, :description)
  end

  if @ticket.update(permitted_params)
    redirect_to after_ticket_update_path, notice: "Ticket updated successfully."
  else
    render :edit, status: :unprocessable_entity
  end
end

  def destroy
    @ticket.destroy
    redirect_to after_ticket_update_path, notice: "Ticket deleted successfully."
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :developer_id, :qa_id)
  end
private

def after_ticket_update_path
  case current_user.role
  when "admin"
    admin_dashboard_path
  when "developer"
    developer_dashboard_path
  when "qa"
    qa_dashboard_path
  else
    user_dashboard_path
  end
end
end
