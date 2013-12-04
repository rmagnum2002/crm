class Ability
  include CanCan::Ability

  attr_accessor :user

  def initialize(u)

    self.user = u || User.new

    if user.new_record?
      user.logger.info('cancan: Anonymous user')
    else
      user.logger.info("cancan: #{user.email}")
    end

    # alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :show_contacts, :show_address, :sales, :show_comments, :country_select_legal, :country_select_invoicing, :to => :company_actions
    alias_action :events_for_day, :open_details, :to => :events_actions
    alias_action :profile, to: :read

    models = ActiveRecord::Base.subclasses - [Site, Employee, State, ActiveAdmin::Comment]

    can :read, Site if user.new_record? # allow user to login
    can :read, Site, id: user.site_id

    if user.role? :admin
      init_admin_perms
    else
      if user.role? :moderator
        # TODO specify rules for moderators
      end

      if user.role? :user
        can :company_actions, Company, site_id: user.site_id
        can :events_actions, Event, site_id: user.site_id

        can :create, [Company, Employee, Comment, Event, Sale]

        can :read, [Company, Comment, Event, User, Sale, Activity], site_id: user.site_id
        # can modify his own records
        can :update, [Company, Employee], :user_id => user.id
        # can destroy own objects
        can :destroy, [Company, Employee, Comment], :user_id => user.id

        can :read, models, site_id: user.site_id

        can :read, State, State.joins(:country).where(countries: {site_id: user.site_id}) do |state|
          state.country.site_id == user.site_id
        end

        can [:index, :read], Employee, Employee.joins(:company).where(companies: {site_id: user.site_id}) do |emp|
          emp.company.site_id == user.site_id
        end
      end
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

  include AdminAbility::AdminPerms
end
