class UsersController < ApplicationController

  def new
    @new_user = true
    if current_user
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/signup'
    end
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id) 
  end
end
