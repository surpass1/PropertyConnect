class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
    elsif user.role == "admin"
      can :manage, :all
    elsif user.role == "author"
      can :read, :all
      can :create, ToDoList
      can :update, ToDoList do |to_do_list|
        to_do_list.user == user
      end
      can :destroy, ToDoList do |to_do_list|
        to_do_list.user == user
      end
    end
  end
end