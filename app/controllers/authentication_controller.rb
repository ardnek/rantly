class AuthenticationController < ApplicationController

  # def new
  #   @user = User.new
  # end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to rants_path
    else
      redirect_to signin_path, notice: 'Username / password combination is invalid'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
