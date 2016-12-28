require 'rails_helper'

describe "When a use visits categories page" do
  scenario "they can delete a category" do
    categories = create_list(:category_with_jobs, 10)

    visit categories_path

    expect(page).to have_content categories.first.title

    click_on("Delete", match: :first)

    expect(current_path).to eq categories_path
    expect(page).to have_content "#{categories.first.title} was successfully deleted!"
  end
end