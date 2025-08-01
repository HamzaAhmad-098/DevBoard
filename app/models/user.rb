class User < ApplicationRecord
  enum role: { user: 0, developer: 1, qa: 2, admin: 3 }
  has_many :created_tickets, class_name: "Ticket", foreign_key: "creator"
  has_many :developed_tickets, class_name: "Ticket", foreign_key: "developer"
  has_many :qa_tickets, class_name: "Ticket", foreign_key: "qa"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
