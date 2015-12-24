class PostsController < ApplicationController
  def index
    @post_index = true
    @posts = Post.all
  end

  def create
    if current_user
      post_params = params.require(:post).permit(:destination, :description)
      post=current_user.posts.new(post_params)
      if post.save
        redirect_to posts_path
      else
        # flash[:error] = post.errors.full_messages.join(", ")  
        redirect_to new_post_path
      end
    end
  end

  def new
  end

  def edit
    post_id = params[:id]
      @post = Post.find(post_id)
    if (@post.user_id).to_i == (current_user.id).to_i
      render :edit
    else
       # flash[:error]="YOU CAN'T EDIT IT"
       redirect_to posts_path
    end
  end

  def show
  end

  def update
  end

  def destroy
    post_id = params[:id]
    post = Post.find(post_id)
    if (post.user_id).to_s == (current_user.id).to_s
      post.destroy
      redirect_to user_path
    # else
    #   flash[:error]="YOU CAN'T DELETE IT"
    end  
    
  end
end
