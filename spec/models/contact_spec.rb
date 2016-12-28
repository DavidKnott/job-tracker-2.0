require "rails_helper"

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without full_name" do
        contact = Contact.new(position:"b", email:"a")

        expect(contact).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with full_name" do
        contact = Contact.new(full_name:"David Knott")

        expect(contact).to be_valid
      end
    end

    describe "relationships" do
      it "belongs to company" do
        contact = create(:contact)
        
        expect(contact).to respond_to(:company)
      end
    end
  end
end