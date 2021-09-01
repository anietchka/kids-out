class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    record.user == user
  end

  def create?
    record.user == user
  end

  def new?
    create?
  end

  def destroy?
    record.user == user
  end
end
