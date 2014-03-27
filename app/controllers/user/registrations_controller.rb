class User::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js

  def after_sign_up_path_for(resource)
    dashboard_path
  end
end