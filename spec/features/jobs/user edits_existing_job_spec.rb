require 'rails_helper'

describe "When a user visits edit company job" do
  scenario "they can edit a job" do
    company = create(:company_with_jobs)
    visit edit_company_job_path(company, company.jobs.first)

    fill_in "job[title]", with: "Developer"

    click_on "Update Job"
    
    expect(current_path).to eq "/companies/#{company.id}/jobs/#{company.jobs.first.id}"
    expect(page).to have_content "Title: Developer"
    expect(page).to have_content "Level of Interest: #{company.jobs.first.level_of_interest}"
    
  end
end