class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale_filter

  before_filter :authenticate_user!


  def set_locale_filter
    if cookies[:lang] && LOCALES.keys.include?(cookies[:lang])
      @locale = cookies[:lang]
    end

    @locale ||= "ro"

    if cookies[:lang] != @locale
      cookies[:lang] = {:value => @locale, :expires => 1.year.from_now}
    end

    I18n.locale = LOCALES[@locale]
    true
  end

  # filter
  def load_company
    if params[:company_id].presence
      @company = Company.find(params[:company_id])
    else
      @company = Company.find(params[:id])
    end

    if @company.nil?
      raise ActiveRecord::RecordNotFound
    end

    true
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
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
end
