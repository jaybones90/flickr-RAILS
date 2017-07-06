require 'rails_helper'


describe "log in a user" do
  it "add a new user to the site" do
    user = FactoryGirl.create(:user, :password => "1234567", :password_confirmation => "1234567")
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign In"
    expect(page).to have_content("You've signed in.")
  end
end
