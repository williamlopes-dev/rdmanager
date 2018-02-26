class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # make it ease api request
  skip_before_action :verify_authenticity_token
end
