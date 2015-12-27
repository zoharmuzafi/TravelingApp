class SessionsController < ApplicationController
  def new
    @welcome = true
    if current_user
      redirect_to user_path(current_user)
    end
    
  end

  def create
    @user = User.find_by_email(params[:email]) 
    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      flash[:error] = "Please check your email and password"
      redirect_to '/login'
    end
  end

  def destroy

    session[:user_id] = nil
    redirect_to '/login'

  end
  
end
