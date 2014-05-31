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
        property.user == user
      end

      can :destroy, Property do |property|
        property.user == user
      end
      
    else
      can :show, Property
    end
  end
end