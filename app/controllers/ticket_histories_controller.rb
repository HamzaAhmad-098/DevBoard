class TicketHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  before_action :set_ticket, only: [ :index ]
  def index
    if @ticket
      @ticket_histories = @ticket.ticket_histories.includes(:user).order(created_at: :desc)
    else
      @ticket_histories = TicketHistory.includes(:ticket, :user).order(created_at: :desc)
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id]) if params[:ticket_id]
  end

  def require_admin!
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end
end
