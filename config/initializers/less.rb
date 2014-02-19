Pi::Application.configure do
  config.less.paths += %w(#{Rails.root}/vendor/assets/bootstrap/less #{Rails.root}/app/assets/less)
  config.less.compress = true
end