class AdminAbility
  include CanCan::Ability

  attr_accessor :user

  def initialize(u)
    self.user = u || AdminUser.new

    if user.new_record?
      user.logger.info('cancan admin: Anonymous admin user')
    else
      user.logger.info("cancan admin: #{user.email}")
    end

    can :read, Site if user.new_record? # allow user to login
    can :read, Site, id: user.site_id # authenticated users has access to their site only

    if user.id == 1 # only first admin
      can :manage, Site
      can :manage, AdminUser
    end

    can :read, ActiveAdmin::Page, :name => 'Dashboard'

    init_admin_perms
  end

  module AdminPerms
    def init_admin_perms
      # without custom models, admin comments are disabled
      models = ActiveRecord::Base.subclasses - [Site, Employee, State, ActiveAdmin::Comment]

      can :manage, models, site_id: user.site_id
      can :manage, State, State.joins(:country).where(countries: {site_id: user.site_id}) do |state|
        state.new_record? || state.country.site_id == user.site_id
      end

      can :manage, Employee, Employee.joins(:company).where(companies: {site_id: user.site_id}) do |emp|
        emp.new_record? || emp.company.site_id == user.site_id
      end

    end
  end

  include AdminPerms
end