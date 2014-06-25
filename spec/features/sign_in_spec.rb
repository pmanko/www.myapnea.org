require "spec_helper"

describe "Signs in user" do
  before do
    @password = "password"
    @user = create(:registered_user, password: @password)

#    expect(@user.valid_password?(@password)).to be_true
#    expect(@user).to be_confirmed
    expect(@user).to be_persisted
  end

  it "should sign in a confirmed user using the main signin page", :js => true do
    pending "Takedown of Under Construction page"

    visit new_user_session_path

    fill_in("Email", with: @user.email)
    fill_in("Password", with: @password)

    click_on "Sign in"

    expect(User.count).to be > 0
    expect(page).to have_content @user.full_name
  end
end