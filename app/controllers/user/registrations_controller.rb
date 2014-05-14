class User::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js

  before_filter :configure_permitted_parameters




  def after_inactive_sign_up_path_for(resource)
    consent_path
  end

  def after_sign_up_path_for(resource)
    consent_path
  end

  def after_sign_in_path_for(resource)
    page_path('thank_you')
  end

  protected

  def configure_permitted_parameters
    [:accepted_pledge_at, :accepted_consent_at].each {|key| params[:user][key] = session[key] if session[key] }

    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :year_of_birth
    devise_parameter_sanitizer.for(:sign_up) << :zip_code
    devise_parameter_sanitizer.for(:sign_up) << :accepted_pledge_at
    devise_parameter_sanitizer.for(:sign_up) << :accepted_consent_at

  end

end