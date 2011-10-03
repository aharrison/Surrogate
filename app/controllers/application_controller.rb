class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    if session['admin'] != 'true'
      raise ActionController::RoutingError.new('Not found')
    end
  end
end
