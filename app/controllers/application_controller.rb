class ApplicationController < ActionController::Base
  protect_from_forgery
  reset_session
end
