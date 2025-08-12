class TicketPolicy < ApplicationPolicy
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

  def show?
    user.admin? ||
    record.creator_id == user.id ||
    record.developer_id == user.id ||
    record.qa_id == user.id
  end

  def create?
    user.admin? || user.qa? || user.developer?
  end

  def update?
    user.admin? || record.creator_id == user.id
  end

  def destroy?
    user.admin?
  end

  def verify?
    user.qa? || user.admin?
  end
end
