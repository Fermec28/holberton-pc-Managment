class Ability
  include CanCan::Ability

  def initialize(user)
      #Define abilities for the passed in user here. For example:
      user ||= User.new # guest user (not logged in)
      if user.has_role? :admin
        can :manage, :all
      end
      if user.has_role? :chief
        can :read, Computer
        can :read, Confirmation
        can :create, Confirmation
        can :update, Subscription
      end
      if user.has_role? :simple_user
        can :manage, Subscription
        can :create, Subscription
        can :update, Subscription do |subscription|
          subscription.user == user
        end
      end        
  end
end
