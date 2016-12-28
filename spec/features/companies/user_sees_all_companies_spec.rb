require 'rails_helper'

describe "When a user visits /companies" do
  scenario "they see a list of all companies" do
    company = Company.create!(name: "ESPN")
    company_two = Company.create!(name: "Disney")

    visit companies_path

    expect(page).to have_content("ESPN")
  end

end
