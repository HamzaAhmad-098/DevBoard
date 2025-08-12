class TicketPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    return true if user.admin?
    return true if user.user? && record.creator_id == user.id
    return true if user.developer? && record.developer_id == user.id
    return true if user.qa? && record.qa_id == user.id
    false
  end

  def create?
    user.admin? || user.user?
  end

  def update?
    return true if user.admin?
    return true if user.user? && record.creator_id == user.id
    return true if user.developer? && record.developer_id == user.id
    return true if user.qa? && record.qa_id == user.id && record.status != "done"
    false
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
