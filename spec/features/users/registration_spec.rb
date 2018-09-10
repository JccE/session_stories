require "rails_helper"


describe "Signing up" do
  it "allows a user to sign up for the site and creates the object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_text("Sign Up")
    click_link "Sign Up"

    fill_in "First Name", with: "Jimmy"
    fill_in "Last Name", with: "Jams"
    fill_in "Email", with: "j@o.com"
    fill_in "Password", with: "123qweasd"
    fill_in "Password (again)", with: "123qweasd"
    click_button "Sign In"

    expect(User.count).to eq(1)
  end
end

