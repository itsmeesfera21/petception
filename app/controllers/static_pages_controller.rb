class StaticPagesController < ApplicationController
  def home
  	@connect = Connect.new
  	
  end

  def help
  end

  def about
  end

  def contact
 		@contact = Contact.new
  end
  def create
  	@contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Thank you for your message. We will contact you soon!"
    else
      flash[:alert] = "Cannot send message."
    end
  end

 def product
 end
  def connect
   #puts params.inspect
if request.post?
   	@connect = Connect.new(connect_params)
    if @connect.save
      begin   
          @pet=Pet.where(_id: @connect.pet_id)         
        @mc.lists.subscribe(@list_id,{'email' => params[:connect][:email]},{'FNAME'=>params[:connect][:firstname],"LNAME"=>params[:connect][:lastname],"MMERGE4"=>params[:connect][:petnames],"MMERGE7"=>@connect.created_at,"MMERGE3"=>@connect._id,"MMERGE4"=>@pet.name})
        flash[:success] = "Success! Check your email to confirm sign up."
       rescue Mailchimp::ListAlreadySubscribedError 
         flash[:alert] = "You have already subscribed to the list"
       rescue Mailchimp::ListDoesNotExistError
         flash[:alert] = "The list could not be found."
       rescue Mailchimp::Error => ex
        if ex.message
        flash[:alert] = "There is an error. Please enter valid email id."
        else
         flash[:alert] = "An unknown error occurred."   
        end  
       end
    else
      flash[:alert] = "Contact not saved!"
    end
  end
    else
 redirect_to '/'
  end	



 private

def contact_params
  params.require(:contact).permit(:email, :firstname, :lastname, :petnames, :inquiry_id, :help_reason)
end

def connect_params
  params.require(:connect).permit(:firstname, :lastname, :email, :petnames, :pet_id, :help_reason)
end

end
