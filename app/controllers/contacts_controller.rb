class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "You've successfully made a contact!"
      redirect_to company_path(@company)
    else
      flash[:failure] = "Please enter a name for your contact" 
      redirect_to company_path(@company)
    end
  end 




  private
  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company_id)
  end

end