class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # protect_from_forgery with: :null_session
  # protect_from_forgery prepend: true
end


def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end
