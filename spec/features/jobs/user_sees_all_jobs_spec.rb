require 'rails_helper'

describe "When a user visits company_jobs" do
  scenario "they see all the jobs for a specific company" do
    company = create(:company_with_jobs)

    visit company_path(company)

    expect(page).to have_content company.jobs.first.title
    expect(page).to have_content company.jobs.last.title
  end
end
