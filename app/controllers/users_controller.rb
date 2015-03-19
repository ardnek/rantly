class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @rants = Rant.all
  end



end
