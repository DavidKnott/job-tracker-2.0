require 'rails_helper'

describe "When a use visits company_job" do
  scenario "they see a specific job" do
    company = create(:company_with_jobs)
    job = company.jobs.first

    visit company_job_path(company, job)

    expect(page).to have_content job.title
    expect(page).to have_content job.city
    expect(page).to have_content job.level_of_interest
  end
end
