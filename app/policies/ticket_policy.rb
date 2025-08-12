class TicketPolicy < ApplicationPolicy
  def index?
    user.admin? || user.user? || user.developer? || user.qa?
  end

  def create?
    user.user? || user.admin?
  end

  def update?
    (user.developer? && record.developer_id == user.id) || user.admin?
  end

  def verify?
    user.qa? || user.admin?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.developer?
        scope.where(developer_id: user.id)
      elsif user.qa?
        scope.where(qa_id: user.id)
      else
        scope.where(creator_id: user.id)
      end
    end
  end
end
