class DebatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end


  def next_phase?
    true
  end

  def end_debate?
    true
  end
end
