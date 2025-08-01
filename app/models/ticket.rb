class Ticket < ApplicationRecord
  enum status: { Created: 0, Assigned_to_a_developer: 1, Marked_in_progress: 2, Sent_to_QA: 3, Marked_as_done: 4 }
  belongs_to :creator, class_name: "User"
  belongs_to :developer, class_name: "User"
  belongs_to :qa,class_name: "User"
  validates :title , presence: true ,length: {minimum: 5}
  validates :status, presence: true
end