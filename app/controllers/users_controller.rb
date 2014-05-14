class UsersController < ApplicationController
  def switch_theme
    @old = (current_user ? current_user.theme : cookies[:theme]) || 'day_theme'
    @new = params[:theme] || 'day_theme'
    if current_user
      current_user.update_attribute(:theme, params[:theme])
    else
      cookies[:theme] = params[:theme]
    end
  end

  def consent
    if params[:consent_signed] && current_user
      current_user.update_attribute(:accepted_consent_at, Time.zone.now)
      redirect_to page_path("thank_you")
    end
  end

  def pledge
    if params[:pledge_signed]
      session[:accepted_pledge_at] = Time.zone.now
      redirect_to new_user_registration_path
    end
  end

end