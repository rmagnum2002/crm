class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  before_filter :set_locale_filter

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
    @company = Company.find(params[:id].presence || params[:company_id].presence)
    @project ||= Company.find_by_id(params[:company_id] || params[:id])

    if @company.nil?
      raise ActiveRecord::RecordNotFound
    end

    true
  end

  helper_method :current_language

  def current_language
    language = cookies[:lang]
    language = params[:locale] if params[:locale]
    language
  end
end
