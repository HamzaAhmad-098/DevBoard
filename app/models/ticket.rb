class Ticket < ApplicationRecord

  enum status: {created: 0, assigned: 1, in_progress: 2, ready_for_qa: 3, done: 4 }
  
  belongs_to :creator, class_name: "User"
  belongs_to :developer ,class_name:"User"
  belongs_to :qa, class_name: "User"
  
  validates :title, presence: true
  validates :status, presence: true
end
