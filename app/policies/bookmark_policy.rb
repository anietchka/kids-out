class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      Scope.where(user: user)
    end
  end
end
