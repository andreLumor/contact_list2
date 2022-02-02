class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_contacts_path(resource) || welcome_path
  end
end
