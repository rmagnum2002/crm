class Ability
  include CanCan::Ability

  # TODO lz can we pass site parameter here?
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    # alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :show_contacts, :show_address, :sales, :show_comments, :country_select_legal, :country_select_invoicing, :to => :company_actions
    alias_action :events_for_day, :open_details, :to => :events_actions

    if user.role? :admin
      # TODO lz admin will moderate only all items for a certain site
      can :manage, :all
    elsif user.role? :moderator
      # TODO lz filter items by site_id
      can :create, Company
      can :create, Employee
      can :create, Comment
      can :create, Event
      can :create, Sale
      can :read, Company
      can :read, Employee
      can :read, Comment
      can :read, Event
      can :read, User
      can :read, Sale
      can :read, Activity
      can :update, Company, :user_id => user.id
      can :update, Employee, :user_id => user.id
      can :destroy, Company, :user_id => user.id
      can :destroy, Employee, :user_id => user.id
      can :destroy, Comment, :user_id => user.id
      can :company_actions, Company
      can :events_actions, Event
    elsif user.role? :user
      can :read, User, :id => user.id
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
