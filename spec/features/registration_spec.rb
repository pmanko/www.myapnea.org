require "spec_helper"


describe "Registers new user" do

  it "with correct credentials", :js => true do
    pending "Takedown of Under Construction Page"

    u = build(:user)
    password = "password"

    visit root_path

    expect(page).to have_content "Join Now!"

    click_on "Join Now!"

    expect(page).to have_content "Our Promise"

    click_on "Awesome - I'm in!"

    expect(page).to have_selector "form#new_user"

    fill_in("First name", with: u.first_name)
    fill_in("Last name", with: u.last_name)
    fill_in("Password", with: password)
    fill_in("Email", with: u.email)
    fill_in("Year of birth", with: u.year_of_birth)
    fill_in("Zip code", with: u.zip_code)

    click_on "Sign up"

    expect(page).to have_content "Before you continue"

    expect(User.all.count).to eq(2)
    cu = User.find_by_last_name(u.last_name)

    expect(cu).to be_present

    expect(cu.first_name).to eq(u.first_name)
    expect(cu.last_name).to eq(u.last_name)
    expect(cu.email).to eq(u.email)
    expect(cu.year_of_birth).to eq(u.year_of_birth)
    expect(cu.zip_code).to eq(u.zip_code)
    expect(cu.accepted_pledge_at).to be_present

    click_on "I Agree to Participate"

    cu = User.find_by_last_name(u.last_name)
    expect(page).to have_content "Thanks!"

    expect(cu.accepted_consent_at).to be_present


    click_on "Enough talk - take me to my site!"

    expect(page).to have_content "Dashboard"


  end
end
