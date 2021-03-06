class DisciplinePolicy < ApplicationPolicy
  def list?
    user.admin? || user.teacher?
  end

  def create?
    list?
  end

  def update?
    list?
  end

  def delete?
    list?
  end
end