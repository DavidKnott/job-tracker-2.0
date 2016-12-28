require 'rails_helper'

describe "When the user vists company page" do
  scenario "they can create a new contact" do
    company = create(:company_with_jobs)
    
    visit company_path(company)

    fill_in "contact[full_name]", :with => "David Knott"
    fill_in "contact[position]", :with => "Manager"
    fill_in "contact[email]", :with => "david1k1nott@gmail.com"

    click_on "Add Contact"

    expect(current_path).to eq company_path(company)
    expect(page).to have_content("David Knott")
    expect(page).to have_content("david1k1nott@gmail.com")
  end
end