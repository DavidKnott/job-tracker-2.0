require "rails_helper"

describe "When a user visits category path" do
  scenario "they see a single category" do
    category = create(:category_with_jobs)
    visit categories_path

    click_on category.title

    visit category_path(category)

    expect(page).to have_content category.title
    expect(page).to have_content category.jobs.last.title
  end
end