class ApplicationController < ActionController::Base
  protect_from_forgery

  Rails.application.routes.default_url_options[:host]= Rails.env.production? ? "fakewhale.com" : "localhost:3000"
end
