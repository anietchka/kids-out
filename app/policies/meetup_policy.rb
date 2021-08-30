class MeetupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user
  end

  def new?
    create?
  end

  def show?
    user
  end

  def destroy?
    record.user == user
  end

  def chat?
    user
  end

end
