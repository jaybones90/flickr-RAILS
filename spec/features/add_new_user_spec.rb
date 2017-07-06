require 'rails_helper'


describe "add a new user" do
  it "add a new user to the site" do
    visit new_user_path
    user = FactoryGirl.build(:user)
    fill_in "User Name", with: user.user_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Confirm Password", with: user.password
    click_on "Sign Up"
    expect(page).to have_content("You've successfully signed up!")
  end
end
