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
    fill_in "Body", with: ("Rant body here" * 25)
    click_on "Save"
    expect(page).to have_content ("Rant title here")
    expect(page).to have_content ("Rant body here")
  end

  scenario "Users can edit a rant" do
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
    fill_in "Body", with: ("Rant body here" * 25)
    click_on "Save"
    expect(page).to have_content ("Rant title here")
    expect(page).to have_content ("Rant body here")
    click_on "Edit"
    fill_in "Title", with: "This is the edited title"
    fill_in "Body", with: ("Rants body here" * 25)
    click_on "Save"
    expect(page).to have_content("This is the edited title")
    expect(page).to have_content("Rants body here")
  end

  scenario "Users can delete a rant" do
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
    fill_in "Body", with: ("Rant body here" * 25)
    click_on "Save"
    expect(page).to have_content ("Rant title here")
    expect(page).to have_content ("Rant body here")
    click_on "Edit"
    click_on "Delete"
    expect(page).to have_no_content ("Rant title here")
    expect(page).to have_no_content ("Rant body here")
  end

  scenario "Users have to type at least 144 characters in body of rant" do
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
    expect(page).to have_content ("Body is too short")
  end


end
