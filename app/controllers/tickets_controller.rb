class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    # Show only relevant tickets for each role
    case current_user.role
    when "user"
      @tickets = current_user.created_tickets
    when "developer"
      @tickets = current_user.developed_tickets
    when "qa"
      @tickets = current_user.qa_tickets
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

  # Force defaults for regular users
  if current_user.user?
    @ticket.status = :created  # or :created if you have that status
    @ticket.developer_id = nil
    @ticket.qa_id = nil
  end

  if @ticket.save
    redirect_to tickets_path, notice: "Ticket created successfully."
  else
    render :new, status: :unprocessable_entity
  end
end


  def edit; end

def update
  if current_user.admin?
    # Admin can update everything including status, developer_id, qa_id
    permitted_params = params.require(:ticket).permit(:title, :description, :status, :developer_id, :qa_id)
  else
    # Other users can update only allowed fields (e.g. maybe just description)
    permitted_params = params.require(:ticket).permit(:title, :description)
  end

  if @ticket.update(permitted_params)
    redirect_to tickets_path, notice: "Ticket updated successfully."
  else
    render :edit, status: :unprocessable_entity
  end
end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: "Ticket deleted successfully."
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :developer_id, :qa_id)
  end
  def verify
  @ticket = Ticket.find(params[:id])
  authorize @ticket, :verify?

  if @ticket.update(status: :verified) # or whatever your verified status is called
    redirect_to tickets_path, notice: "Ticket verified successfully."
  else
    redirect_to tickets_path, alert: "Failed to verify ticket."
  end
end

end