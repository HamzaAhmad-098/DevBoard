class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :mark_done]
  after_action :verify_authorized

  def index
    @tickets = policy_scope(Ticket)
    authorize Ticket
  end

  def show
    authorize @ticket
  end

  def new
    @ticket = current_user.tickets.new
    authorize @ticket
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    authorize @ticket
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def update
    authorize @ticket
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    authorize @ticket
    @ticket.destroy
    redirect_to tickets_path
  end

  def mark_done
    authorize @ticket, :mark_done?
    @ticket.update(status: "done")
    redirect_to @ticket
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :assignee_id, :qa_user_id, :status)
  end
end
