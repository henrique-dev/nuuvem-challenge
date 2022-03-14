class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  helper_method :url_for

  def default_url_options
    { only_path: false, port: 8020 }
  end
end
