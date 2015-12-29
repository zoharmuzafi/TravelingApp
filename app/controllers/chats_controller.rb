class ChatsController < ApplicationController
  
  	before_filter :authorize

	def index
		@chat_index = true
	end

	def create
		chat_id = params.require(:chat).permit(:chat_id)["chat_id"]
		chat = Chat.find(chat_id)
		message_params = params.require(:chat).permit(:content)
		new_message = chat.messages.new(message_params)
		new_message.content = "#{current_user.name.capitalize}: #{new_message.content}"
		if new_message.save
			redirect_to chats_path
		else
			flash[:error] = "message wasn't sent"
			redirect_to chats_path
		end 
	end
	def destroy
	end
end
