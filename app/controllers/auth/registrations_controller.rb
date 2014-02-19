class Auth::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js

  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

  before_filter :configure_permitted_parameters

  def new
    MY_LOG.info "NEW"
    @skip_intro = params[:skip_intro] ? true : false
    build_resource({})
    respond_with self.resource
  end


  # POST /resource
  def create
    MY_LOG.info "CREATE"
    build_resource(sign_up_params)

    if resource.save
      MY_LOG.info "Saved!"
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      MY_LOG.info "Not Saved! #{resource.errors.full_messages}"
      clean_up_passwords resource
      respond_with resource
    end
  end


  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:password, :password_confirmation, :email, :first_name, :last_name) }
  end


end
