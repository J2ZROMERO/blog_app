# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Post, author_id: user.id
    can :destroy, Post do |post|
      user.role == "admin"
    end
  end
  
end
