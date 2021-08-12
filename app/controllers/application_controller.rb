class ApplicationController < ActionController::Base
  #prevent user to access whole application from devise
  before_action :authenticate_user!
end
