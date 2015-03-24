class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @rants = @user.rants.all.order('created_at DESC')
  end



end
