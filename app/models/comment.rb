class Comment < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :ticket, class_name: "Ticket"
  validates :content, presence: true, length: { minimum: 10 }
end
