class ApplicationController < ActionController::Base
  protect_from_forgery

  def tecnologiedemocratiche_oauth_client
    @client ||= OAuth2::Client.new(ENV['TECNOLOGIEDEMOCRATICHE_APP_ID'],
                                   ENV['TECNOLOGIEDEMOCRATICHE_APP_SECRET'], site: ENV['TECNOLOGIEDEMOCRATICHE_APP_URL'])
  end

  def tecnologiedemocratiche_access_token
    @token ||= OAuth2::AccessToken.new(tecnologiedemocratiche_oauth_client, current_user.doorkeeper_access_token) if current_user
  end

  def new_session_path(scope)
    new_user_session_path
  end
end
