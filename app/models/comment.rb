class Comment < ApplicationRecord
  belongs_to :user_id
  belongs_to :ticket_id
end
