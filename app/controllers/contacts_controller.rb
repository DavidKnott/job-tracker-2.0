class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:id])
    @contact = @company.contacts.new(contact_params)
  end 

end