class ChatsController < ApplicationController
  def create
	    chat = Chat.new()
	    owner = User.find(@user_id)
	    
	    if chat.save 
	      redirect_to posts_path
	    else
	      flash[:error] = "Message wasn't sent"
	      redirect_to posts_path
    end
  end

  def index
  end

  def destroy
  end
end
