class ReviewPolicy < ApplicationPolicy
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

  def destroy?
    record.user == user
  end

end
