class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_dashboard
def admin
  @users = User.all
  @tickets = Ticket.all
end
def developer
  @tickets = Ticket.where(developer_id: current_user.id)
end
def qa
  @tickets = Ticket.where(status: :ready_for_qa, qa_id: current_user.id)
end
def user
  @tickets = Ticket.where(creator_id: current_user.id)
end

  private

def authorize_dashboard
   case action_name
   when "admin"
     redirect_to root_path, alert: "Not authorized" unless current_user.admin?
   when "developer"
     redirect_to root_path, alert: "Not authorized" unless current_user.developer?
   when "qa"
     redirect_to root_path, alert: "Not authorized" unless current_user.qa?
   when "user"
     redirect_to root_path, alert: "Not authorized" unless current_user.user?
   end
 end
end
