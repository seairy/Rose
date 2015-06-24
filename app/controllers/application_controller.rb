class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def auto_select_language
    language = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first || I18n.default_locale
    redirect_to "/#{language}"
  end
end