require 'rails_helper'

describe "When a user visits company jobs" do
  scenario "they can delete a job" do
    company = create(:company_with_jobs)
    visit company_jobs_path(company)


    click_link("Delete", match: :first)


    expect(current_path).to eq company_jobs_path(company)
    expect(page).to have_content  "was successfully deleted!"
  end
end