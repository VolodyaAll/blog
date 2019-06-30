class ContactsController < ApplicationController

  def new
  end

  def create
    @contact = Contact.new(contact_params)

    unless @contact.save
      render action: 'new'
    end 
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
