class UserPolicy < ApplicationPolicy
  
  def show?
    return true
  end

  def dashboard?
    return true
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
