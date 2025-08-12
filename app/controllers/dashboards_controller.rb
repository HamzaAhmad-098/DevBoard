class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def user
    @tickets = current_user.created_tickets
  end

  def developer
    @tickets = current_user.developed_tickets
  end

  def qa
    @tickets = current_user.qa_tickets
  end

  def admin
    @tickets = Ticket.all
    @users = User.all
  end
end
