require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WwwMyapneaOrg
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('lib', 'data', 'content', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :en


    # Precompile additional assets.
    # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
    # NOTE: TEMPORARY
    # TODO: Remove once issue #129 on sprockets-rails gem is merged
    config.assets.precompile += %w( day_theme.css night_theme.css reports/*)

    # Set templating engine for stylesheets to less.
    config.app_generators.stylesheet_engine :less

  end
end
