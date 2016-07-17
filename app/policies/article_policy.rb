class ArticlePolicy < ApplicationPolicy
  def edit?
    author?
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  private

  def author?
    record.author == user
  end
end
