class TicketHistory < ApplicationRecord
  belongs_to :ticket, class_name: "Ticket"
  belongs_to :user, class_name: "User"
  validates :action, presence: true
end
