class Ability
  include CanCan::Ability

  def initialize user
    if user.present?
      if user.admin?
        can :manage, :all
      else
        can :create, Comment
        can :manage, Order, user_id: user.id
        can :read, User, id: user.id
      end
    else
      can :read, :all
    end
  end
end
