require 'rails_helper'

describe "When a user visits company job page" do
  scenario "they can create a comment" do
    company = create(:company_with_jobs)
    job = company.jobs.first

    visit company_job_path(company, job)

    fill_in "comment[content]", :with => "This would be a great job!"
    click_on "Leave Comment"
  end
end

