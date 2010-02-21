# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :authenticate, :except => [:phone, :create]

  private
    def authenticate
      if user = authenticate_with_http_basic { |username, password| User.authenticate(username, password) }
        @current_user = user
      else
        request_http_basic_authentication "Secure Volunteer Connect"
      end
    end
end

