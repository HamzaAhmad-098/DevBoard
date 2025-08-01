class Comment < ApplicationRecord
  belongs_to :user_id , class_name: "User"
  belongs_to :ticket_id, class_name: "Ticket"
  validates :content , presence: true , length: {minimum: 10} 
end
