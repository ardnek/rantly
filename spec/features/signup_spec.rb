require "rails_helper"
require "capybara/rails"

feature "SignUp" do
  scenario "User can register at the signup route" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Bill"
    fill_in "Last name", with: "Murray"
    fill_in "Email", with: "bill@murray.com"
    fill_in "Password", with: "password"
    within ".form-horizontal" do
      click_on "Sign Up"
    end
    expect(page).to have_content("Bill")
  end

  scenario "Users can signout" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Bill"
    fill_in "Last name", with: "Murray"
    fill_in "Email", with: "bill@murray.com"
    fill_in "Password", with: "password"
    within ".form-horizontal" do
      click_on "Sign Up"
    end
    expect(page).to have_content("Bill")
    click_on "Sign out"
    expect(page).to_not have_content("Bill")
  end


end
