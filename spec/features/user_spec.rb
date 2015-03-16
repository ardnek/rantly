require "rails_helper"
require "capybara/rails"

feature "Users" do
  scenario "All users are listed at the users route" do
    user = create_user
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Bill"
    fill_in "Last name", with: "Murray"
    fill_in "Email", with: "bill@murray.com"
    fill_in "Password", with: "password"
    within ".form-horizontal" do
      click_on "Sign Up"
    end
    visit users_path
    expect(page).to have_content("Audrey")
  end
end
