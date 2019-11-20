class UserPolicy < ApplicationPolicy
  
  def dashboard?
    return true
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
