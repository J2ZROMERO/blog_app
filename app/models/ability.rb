class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, Post
      can :read, User
      can :create, Post
      can :create, Comment
      can :read, Comment
      can :update, Comment, author_id: user.id
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, author_id: user.id
    end
  end
end