class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :verify]

  def index
    @tickets = policy_scope(Ticket)
  end

  def show
    authorize @ticket
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = current_user.created_tickets.build(ticket_params)
    authorize @ticket
    if @ticket.save
      redirect_to @ticket, notice: "Ticket was successfully created."
    else
      render :new
    end
  end

  def edit
    authorize @ticket
  end

  def update
    authorize @ticket
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: "Ticket was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @ticket
    @ticket.destroy
    redirect_to tickets_path, notice: "Ticket deleted."
  end

  def verify
    authorize @ticket, :verify?
    @ticket.update(status: :done)
    redirect_to tickets_path, notice: "Ticket verified."
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :developer_id, :qa_id)
  end
end
