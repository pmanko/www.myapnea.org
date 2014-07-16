module ApplicationHelper

  def current_theme
    # You'll have to implement the logic for a user choosing a theme
    # and how to record that in the model.
    # Also, come up with a better name for your default theme, like 'twentyeleven' ;)
    (user_signed_in? ? current_user.theme : cookies[:theme]) || 'day_theme'
  end

  def markdown(text)
    text = '' if text.nil?
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(text).html_safe
  end

  def flash_class(level)
    case level.to_sym
      when :notice then "text-info"
      when :success then "text-success"
      when :error then "text-danger"
      when :alert then "text-danger"
      else ""
    end
  end

  def flash_alert_class(level)
    case level.to_sym
      when :notice then "warning"
      when :success then "success"
      when :error then "danger"
      when :alert then "danger"
      else ""
    end
  end
end
