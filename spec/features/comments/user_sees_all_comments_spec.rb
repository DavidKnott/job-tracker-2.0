require 'rails_helper'

describe "When a user visits company jobs page" do
  scenario "they can see all comments" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    
    visit company_job_path(company, job)

    expect(page).to have_content job.comments.first.content
    expect(page).to have_content job.comments.last.content
  end
end