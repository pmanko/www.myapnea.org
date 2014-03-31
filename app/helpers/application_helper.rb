module ApplicationHelper

  def current_theme
    # You'll have to implement the logic for a user choosing a theme
    # and how to record that in the model.
    # Also, come up with a better name for your default theme, like 'twentyeleven' ;)
    (user_signed_in? ? current_user.theme : cookies[:theme]) || 'day_theme'
  end

end
