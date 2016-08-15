class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      if request.format == Mime::HTML
        redirect_to login_url, notice: "Please log in" 
      else
        unless authenticate_or_request_with_http_basic do |name, password|
              user = User.find_by_name(name)
              user.authenticate(password) if user
          end
          render :status => 403, :text => "---Login failed---\n" and return
        end
      end
    end
  end

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
