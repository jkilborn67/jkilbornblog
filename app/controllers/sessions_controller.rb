class SessionsController < ApplicationController

  def new

  end  
  
  def create
    # get the user from the email address
    user = User.find_by(email: params[:session][:email].downcase)
    # check if user is valid, and it authenticates with passwd
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have sucessfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id]= nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end
