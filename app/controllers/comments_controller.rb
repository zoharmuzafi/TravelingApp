class CommentsController < ApplicationController

  def create

    comment_params = params.require(:comment).permit(:line, :post_id, :user_id)
    comment = Comment.new(comment_params)
    comment.line = "#{current_user.name}: #{comment.line}"
    if comment.save
      redirect_to posts_path
    else
      flash[:error] = "Your comment is too short"
      redirect_to posts_path
    end

  end

  def destroy
    comment_id = params[:id]
    comment = Comment.find(comment_id)
    post_id = comment.post_id
    post = Post.find(post_id)
    user_id = post.user_id
    comment.destroy
    redirect_to posts_path 
  end
end
