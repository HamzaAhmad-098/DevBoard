class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :verify]


  def index
    @tickets = policy_scope(Ticket)
  end

  def show
    authorize @ticket
  end

  def create
    @ticket = current_user.tickets.build(ticket_params)
    authorize @ticket
    if @ticket.save
      redirect_to @ticket, notice: "Ticket created."
    else
      render :new
    end
  end

  def update
    authorize @ticket
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: "Ticket updated."
    else
      render :edit
    end
  end

  def verify
    authorize @ticket, :verify?
    @ticket.update(status: "verified")
    redirect_to @ticket, notice: "Ticket verified."
  end

  def destroy
    authorize @ticket
    @ticket.destroy
    redirect_to tickets_path, notice: "Ticket deleted."
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :assigned_to_id)
  end
  
end
