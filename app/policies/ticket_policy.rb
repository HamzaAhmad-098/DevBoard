class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.developer?
        scope.where(developer_id: user.id)
      elsif user.qa?
        scope.where(qa_id: user.id)
      else # regular user
        scope.where(creator_id: user.id)
      end
    end
  end

  def index?
    true
  end

  def show?
    user.admin? || record.creator_id == user.id || record.developer_id == user.id || record.qa_id == user.id
  end

  def create?
    user.user? || user.admin?
  end

  def update?
    user.admin? || (user.developer? && record.developer_id == user.id)
  end

  def verify?
    user.qa? || user.admin?
  end

  def destroy?
    user.admin?
  end
end
