class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      Scope.where(user: user)
    end
  end

   def index?
    true
  end


  def create?
    user
  end

  def new?
    create?
  end

  def destroy?
    record.user == user
  end

end
