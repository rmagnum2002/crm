class Ability
  include CanCan::Ability

  def initialize(user, site)
    raise ArgumentError if site.nil?

    # reset to anonymous if user does not belong to current site
    if user && user.site_id != site.id
      user = nil
    end

    user ||= User.new.tap do |obj|
      obj.site = site
    end

    if user.new_record?
      site.logger.info('cancan: Anonymous user')
    else
      site.logger.info("cancan: #{user.email}, #{site.host}")
    end

    # alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :show_contacts, :show_address, :sales, :show_comments, :country_select_legal, :country_select_invoicing, :to => :company_actions
    alias_action :events_for_day, :open_details, :to => :events_actions
    alias_action :profile, to: :read

    if user.role? :admin
      # TODO check if admin can see contacts
      can :manage, :all, site_id: site.id
    else
      if user.role? :moderator
        # TODO specify rules for moderators
      end

      if user.role? :user
        can :company_actions, Company, site_id: site.id
        can :events_actions, Event, site_id: site.id

        can :create, [Company, Employee, Comment, Event, Sale]

        can :read, [Company, Comment, Event, User, Sale, Activity], site_id: site.id
        # can modify his own records
        can :update, [Company, Employee], :user_id => user.id
        # can destroy own objects
        can :destroy, [Company, Employee, Comment], :user_id => user.id

        can :read, :all, :site_id => site.id

        can [:index, :read], Employee.joins(:company).where(companies: {site_id: site.id}) do |emp|
          emp.company.site_id == site.id
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
end
