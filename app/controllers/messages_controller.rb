class MessagesController < ApplicationController
	def create
	  		chat = Chat.create
	  		@chat_id = chat.id
		  	message_params = params.require(:message).permit(:content)
		    message = chat.messages.new(message_params)
		    join = chat.userchats.new
		    join.user_id=current_user.id
		    join.save
		    join2_params=params.require(:message).permit(:user_id)
		    join2 = chat.userchats.new(join2_params)
		    join2.save
		    if message.save 
		      redirect_to posts_path
		    else
		      flash[:error] = "Message wasn't sent"
		      redirect_to posts_path
	    end
	end

end
