class ApplicationController < ActionController::Base
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
        unless authenticate_with_http_basic do |name, password|
              user = User.find_by_name(name)
              user.authenticate(password) if user
          end
          render :status => 403, :text => "---Login failed---\n" and return
        end
      end
    end

    # unless User.find_by(id: session[:user_id])
    #   if request.format == Mime::HTML
    #     redirect_to login_url, notice: "Please login"
    #   else
    #     user = authenticate_or_request_with_http_basic do |name, password|
    #       name == "david" && password == "secret"
    #     end 

    #     if user
    #       session[:user_id] = user.id
    #     else
    #       render status: 403, text: "Login failed" and return
    #     end        
    #   end
    # end
  end
end
