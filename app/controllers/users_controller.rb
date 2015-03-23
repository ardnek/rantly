class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @rants = Rant.all.order('created_at DESC')
  end



end
