require "rails_helper"
require "capybara/rails"

feature "Rants" do
  scenario "Users can create a rant" do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Bill"
    fill_in "Last name", with: "Murray"
    fill_in "Email", with: "bill@murray.com"
    fill_in "Password", with: "password"
    within ".form-horizontal" do
      click_on "Sign Up"
    end

    visit root_path
    click_on "New Rant"
    fill_in "Title", with: "Rant title here"
    fill_in "Body", with: "Rant body here"
    click_on "Save"
    expect(page).to have_content ("Rant title here")
    expect(page).to have_content ("Rant body here")
  end

end
