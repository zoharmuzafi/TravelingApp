class MessagesController < ApplicationController

	before_filter :authorize

	def create
	  		chat = Chat.create
	  		@chat_id = chat.id
		  	message_params = params.require(:message).permit(:content)
		    message = chat.messages.new(message_params)
		    sender_name = current_user.name
		    destination = params.require(:message).permit(:post_destination)["post_destination"]
		    message.content = "#{sender_name.capitalize}, regarding your trip to #{destination}: #{message.content}"
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
