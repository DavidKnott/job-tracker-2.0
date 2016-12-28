require 'rails_helper'

describe "When a user visits company page" do
  scenario "they see all contacts for that company" do
    company = create(:company_with_contacts)

    visit company_path(company)

    expect(page).to have_content company.contacts.first.full_name
    expect(page).to have_content company.contacts.last.email
  end
end