require 'rails_helper'

describe "When a user visits categories" do
  scenario "they see all categories" do
    categories = create_list(:category, 10)
    visit categories_path

    expect(page).to have_content categories[0].title
    expect(page).to have_content categories[9].title
  end
end