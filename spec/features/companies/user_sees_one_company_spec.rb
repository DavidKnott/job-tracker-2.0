require 'rails_helper'

describe "When a user visits /company/:id" do
  scenario "they see an existing company" do
    company = create(:company_with_jobs)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content company.jobs.first.title
    expect(page).to have_content company.jobs.last.title
  end
end
