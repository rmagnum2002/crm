class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale_filter
  before_filter :load_site
  #before_filter :authenticate_user!

  def set_locale_filter
    if cookies[:lang] && LOCALES.keys.include?(cookies[:lang])
      @locale = cookies[:lang]
    end

    # TODO get locale from browser request headers
    # Accept-Language: ro,en-US;q=0.8,en;q=0.6
    @locale ||= 'ro'

    if cookies[:lang] != @locale
      cookies[:lang] = {:value => @locale, :expires => 1.year.from_now}
    end

    I18n.locale = LOCALES[@locale]
    true
  end

  # filter
  def load_site
    logger.debug "Loading site: #{request.host}"
    @site = Site.where(host: request.host).first

    if @site.nil?
      render text: 'Site not found', status: :not_found
      return false
    end

    authorize! :read, @site

    true
  end

  helper_method :current_site

  def current_site
    @site
  end

  # filter
  def load_company
    @company = @site.companies.find(params[:company_id].presence || params[:id])
  end

  rescue_from CanCan::AccessDenied do |exception|
    logger.error("Cancan access denied: #{exception.message}, #{exception.subject}, #{exception.action}")
    flash[:error] = 'Access denied!'
    redirect_to error_path
  end

  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end

  helper_method :current_language

  def current_language
    language = cookies[:lang]
    language = params[:locale] if params[:locale]
    language
  end

  def current_ability
    @current_ability ||= ::Ability.new(current_user)
  end

  unless Rails.env.production?
    def redirect_to(*args)
      trace = params[:full_debug] ? caller[0..10].join("\n") : caller.first
      logger.debug 'Redirect from: ' + trace
      super(*args)
    end
  end

  # For paper trail to not load user in admin area
  def user_for_paper_trail
    warden.session_serializer.stored?(:user) ? current_user : nil
  end
end
