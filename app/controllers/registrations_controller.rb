class RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    user_contacts_path(resource) || welcome_path
  end
end
