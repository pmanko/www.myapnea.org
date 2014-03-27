class User::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js
end