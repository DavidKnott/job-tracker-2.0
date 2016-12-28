require 'rails_helper'

describe 'When a user visits new category page' do
  scenario 'they can create a new category' do
    job1, job2, job3 = create_list(:job, 3)
    visit new_category_path

    fill_in "Title", :with => "Back end"
    check("job-#{job1.id}")
    check("job-#{job2.id}")

    click_button "Create"

    expect(current_path).to eq category_path(Category.last)
    expect(page).to have_content "#{job1.title}"
    expect(page).to have_content "#{job2.title}"
    expect(page).to_not have_content "#{job3.title}"
  end
end