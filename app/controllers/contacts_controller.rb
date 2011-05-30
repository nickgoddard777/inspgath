class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		if @contact.save
			redirect_to('/', :notice => "Request was successfully sent.")
		else
			flash[:alert] = "You must fill all the marked fields."
			render 'new'
		end
	end
end

