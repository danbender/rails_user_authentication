require 'spec_helper'

feature "Sign up" do
  scenario "a user signs up with valid credentials" do
    visit root_path
    fill_in :user_email, with: "dan@bender.com"
    fill_in :user_password, with: "ze_jehmans"
    click_on "Save User"
    expect(page).to have_content("dan@bender.com")
  end
end

feature "Sign out" do
  scenario "a user signs out" do
    visit root_path
    fill_in :user_email, with: "dan@bender.com"
    fill_in :user_password, with: "ze_jehmans"
    click_on "Save User"
    click_on "Sign out"
    expect(page).to have_content("Sign up")
  end
end
