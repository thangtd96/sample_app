class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :set_locale
  include SessionsHelper

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def verify_admin!
    return if logged_in?
    store_location
    flash[:danger] =  t "flash.login"
    redirect_to login_url
  end

  def erros_create message
    message.errors.full_messages
  end
end
