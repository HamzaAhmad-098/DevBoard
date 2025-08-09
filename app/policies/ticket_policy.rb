class TicketPolicy < ApplicationPolicy
  def index?
    case user.role
    when "admin" then true
    when "developer"
      true
    when "qa"
      true
    when "user"
      true
    else
      false
    end
  end

  def show?
    case user.role
    when "admin"
      true
    when "developer"
      record.assignee_id == user.id
    when "qa"
      record.qa_user_id == user.id
    when "user"
      record.creator_id == user.id
    else
      false
    end
  end

  def create?
    user.user? || user.admin?
  end

  def update?
    case user.role
    when "admin"
      true
    when "developer"
      record.assignee_id == user.id
    when "qa"
      record.qa_user_id == user.id
    else
      false
    end
  end

  def destroy?
    user.admin?
  end

  def mark_done?
    user.qa? && record.qa_user_id == user.id
  end

  class Scope < Scope
    def resolve
      case user.role
      when "admin"
        scope.all
      when "developer"
        scope.where(assignee_id: user.id)
      when "qa"
        scope.where(qa_user_id: user.id)
      when "user"
        scope.where(creator_id: user.id)
      else
        scope.none
      end
    end
  end
end
