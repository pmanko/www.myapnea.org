require 'spec_helper'

describe PatientController do

  describe "GET 'profile'" do
    it "returns http success" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:confirmed_user, password: "secret")
      sign_in User.find(user.id)


      get 'profile'
      response.should be_success
    end
  end

end
