class ApplicationController < ActionController::Base
  protect_from_forgery

  def doorkeeper_oauth_client
    @client ||= OAuth2::Client.new(ENV['DOORKEEPER_APP_ID'], ENV['DOORKEEPER_APP_SECRET'], :site => ENV['DOORKEEPER_APP_URL'])
  end

  def doorkeeper_access_token
    @token ||= OAuth2::AccessToken.new(doorkeeper_oauth_client, current_user.doorkeeper_access_token) if current_user
  end

  def new_session_path(scope)
    new_user_session_path
  end
end
