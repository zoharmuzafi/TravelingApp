class UsersController < ApplicationController

  def new
    @new_user = true
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to '/signup'
    end
  end

  def show
    @show_user = true
    user_id = params[:id]
    @user = User.find(user_id) 
  end

  def update
  end
end
