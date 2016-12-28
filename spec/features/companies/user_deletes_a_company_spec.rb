require 'rails_helper'

describe "When a user visits /companies" do
  scenario "they can delete a company" do
    company = Company.create(name: "ESPN")
    visit companies_path

    within(".company_list") do
      click_link "Delete"
    end

    expect(page).to have_content("ESPN was successfully deleted!")
  end
end
