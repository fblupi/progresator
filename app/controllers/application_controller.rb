class ApplicationController < ActionController::Base
  before_action :set_locale

  protect_from_forgery with: :exception

  private

  def set_locale
    if params[:lang] && I18n.available_locales.include?(params[:lang].to_sym)
      I18n.locale = params[:lang].to_sym
    else
      I18n.locale = I18n.default_locale
    end
  end
end
