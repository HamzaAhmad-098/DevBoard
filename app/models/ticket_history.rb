class TicketHistory < ApplicationRecord
  belongs_to :ticket_id ,class_name: "Ticket"
  belongs_to :user_id,class_name: "User"
  validates :action ,presence: true
end
