require "spec_helper"


describe "Registers new user" do

  it "with correct credentials", :js => true do
    u = build(:user)
    password = "password"

    visit page_path('splash')

    expect(page).to have_content "Join Now!"

    click_on "Join Now!"

    expect(page).to have_content "Our Promise"

    click_on "Awesome - I'm in!"

    expect(page).to have_selector "form#new_user"

    fill_in("First name", with: u.first_name)
    fill_in("Last name", with: u.last_name)
    fill_in("Password", with: password)
    fill_in("Email", with: u.email)

    click_on "Sign up"

    expect(page).to have_content "Before you continue..."

    click_on "I Agree to Participate"

    expect(page).to have_content "Thank you for signing up!"

    click_on "Enough talk - take me to my site!"

    expect(page).to have_content "Dashboard"
  end
end
