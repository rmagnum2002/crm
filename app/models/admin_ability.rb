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

    can :read, Site
    can :read, ActiveAdmin::Page, :name => 'Dashboard'

    init_admin_perms
  end

  module AdminPerms
    def init_admin_perms
      # without custom models, admin comments are disabled
      models = ActiveRecord::Base.subclasses - [Site, Employee, State, ActiveAdmin::Comment]

      can :manage, models, site_id: user.site_id
      can :manage, State, State.joins(:country).where(countries: {site_id: user.site_id}) do |state|
        state.country.site_id == user.site_id
      end

      can :manage, Employee, Employee.joins(:company).where(companies: {site_id: user.site_id}) do |emp|
        emp.company.site_id == user.site_id
      end

    end
  end

  include AdminPerms
end
