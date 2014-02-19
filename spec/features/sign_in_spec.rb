require "spec_helper"


describe "Signs in user" do
  before do
    @password = "mypassword11"
    @user = create(:confirmed_user, password: @password)

    expect(@user.valid_password?(@password)).to be_true
    expect(@user).to be_confirmed
    expect(@user).to be_persisted
  end

  it "should sign in a confirmed user using the main signin page", :js => true do
    visit new_user_session_path


    fill_in("Email address", with: @user.email)
    fill_in("Password", with: @password)

    click_on "Sign in"

    expect(User.count).to be > 0
    expect(page).to have_content @user.full_name

  end

  it "should sign in a confirmed user using dropdown signin", :js => true do
    visit root_path

    click_link "user-menu-dropdown"

    fill_in("Email address", with: @user.email)
    fill_in("Password", with: @password)

    click_on "Sign in"

    expect(User.count).to be > 0
    expect(page).to have_content @user.full_name
  end
end
