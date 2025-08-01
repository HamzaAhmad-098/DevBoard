class User < ApplicationRecord
  enum role: { user: 0, developer: 1, qa: 2, admin: 3 }
  has_many :created_tickets, class_name: "Ticket", foreign_key: "creator"
  has_many :developed_tickets, class_name: "Ticket", foreign_key: "developer"
  has_many :qa_tickets, class_name: "Ticket", foreign_key: "qa"

  validates :name , presence: true
  validates :email ,presence: true , uniqueness:true
  validates :role ,presence: true
  validate :email_is_in_correct_format
  def email_is_in_correct_format
    email_string = self.email.to_s.strip
    if email_string.count('@') !=1
      errors.add(:email , "must contain atleast one @")
      return
    end
    username, domain = email_string.split('@')
    if username.blank? || domain_name.blank?
      errors.add(:email , "not in correct format ")
      return
    end
    if !domain.include?('.') || domain.start_with?('.') || domain.end_with?('.')
      errors.add(:email ,"not in correct format ")
      return
    end
    if username.start_with?('.') || username.end_with?('.') || username.include?('..')
      errors.add(:email , "not in corect format ")
      return
    end
  end
end