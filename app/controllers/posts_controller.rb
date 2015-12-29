class PostsController < ApplicationController

  before_filter :authorize
  
  def index
    @post_index = true
    @posts = Post.all
  end
  def new
  end
  def create
    if current_user
      post_params = params.require(:post).permit(:destination, :description)
      post=current_user.posts.new(post_params)
      if post.save
        redirect_to posts_path
      else
        flash[:error] = post.errors.full_messages.join(", ")  
        redirect_to user_path(current_user)
      end
    end
  end

  def edit
    post_id = params[:id]
      @post = Post.find(post_id)
    if (@post.user_id).to_i == (current_user.id).to_i
      render :edit
    else
       redirect_to posts_path
    end
  end

  def update
    post_id = params[:id]
    post = Post.find(post_id)
    user_id = post.user_id
    post_params = params.require(:post).permit(:destination, :description)
    if creature.update_attributes(post_params)
      redirect_to user_path(user_id)
    else
      flash[:error] = post.errors.full_messages.join(", ")
  end

  end

  def destroy
    post_id = params[:id]
    post = Post.find(post_id)
    user_id = post.user_id
    if (post.user_id).to_s == (current_user.id).to_s
      post.destroy
      redirect_to user_path(user_id)
    else
      flash[:error]="Sorry, you can't delete this post"
    end  
    
  end
end
