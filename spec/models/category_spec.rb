require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attribute" do
      it "is invalid without a title" do
        category = Category.new
        expect(category).to be_invalid
      end
      
      it "is invalid with an existing title" do
        Category.create(title: "David")
        category = Category.new(title: "David")

        expect(category).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      category = create(:category)
      expect(category).to respond_to(:jobs)
    end
  end
end