class TopicPolicy < ApplicationPolicy

  def show?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
