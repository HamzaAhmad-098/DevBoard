class Ticket < ApplicationRecord
  enum status: { created: 0, assigned: 1, in_progress: 2, ready_for_qa: 3, done: 4 }

  belongs_to :creator, class_name: "User"
  belongs_to :developer, class_name: "User", optional: true
  belongs_to :qa, class_name: "User", optional: true
  has_many :comments, dependent: :destroy
  has_many :ticket_histories


  validates :title, presence: true
  validates :status, presence: true
end
