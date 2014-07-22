class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user 
    user.roles.each {|role| send(role) }
  end
  
  # Role Inheritance  
  def unregistered  admin
    can :read, :all
  end

  def registered
    registered
    can :manage, Property, :user_id => user.id
    can :manage, Profile,  :user_id => user.id
  end
  
  def admin
    admin
    can :access, :rails_admin
  end

end

 