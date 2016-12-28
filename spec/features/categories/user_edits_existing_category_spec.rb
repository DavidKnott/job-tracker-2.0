require 'rails_helper'

describe "When a user visits edit category page" do
  scenario "they can edit a category" do
    category = create(:category)
    job1, job2, job3 = create_list(:job, 3)

    visit edit_category_path(category)
    
    fill_in "Title", :with => "Back end"
    check("job-#{job1.id}")
    check("job-#{job3.id}")

    click_button "Update"

    expect(current_path).to eq category_path(category)
    expect(page).to have_content "Back end"
    expect(page).to have_content job3.title
    expect(page).to_not have_content job2.title
  end
end