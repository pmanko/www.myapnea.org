class UsersController < ApplicationController
  def switch_theme
    @old = (current_user ? current_user.theme : cookies[:theme])
    @new = params[:theme]
    if current_user
      current_user.update_attribute(:theme, params[:theme])
    else
      cookies[:theme] = params[:theme]
    end
  end
end