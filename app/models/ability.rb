class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
    elsif user.role == "admin"
      can :manage, :all
    elsif user.role == "registered"
      can :read, :all
      can :create, Property
      can :update, Property do |property|
        property.user_id == user_id
      end
      can :destroy, Property do |property|
        property.user_id == user_id
      end
    else
      can :show, Property
    end
  end
end