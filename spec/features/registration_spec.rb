require "spec_helper"


describe "Registers new user" do

  it "with correct credentials", :js => true do
    u = build(:user)
    password = "mypassword11"

    visit new_user_registration_path

    expect(page).to have_content "Join Now!"

    click_on "Join Now!"

    expect(page).to have_selector "form#new_user"

    fill_in("First name", with: u.first_name)
    fill_in("Last name", with: u.last_name)
    fill_in("Password", with: password)
    fill_in("Password confirmation", with: password)
    fill_in("Email", with: u.email)
    fill_in("Email confirmation", with: u.email)

    click_on "Sign up"

    expect(page).not_to have_selector "form#new_user"

    expect(page).to have_content "Thank you for signing up!"
    expect(page).to have_content "Before your account becomes active, you will have to confirm your email address using the link provided."
  end
end




