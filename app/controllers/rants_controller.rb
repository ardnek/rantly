class RantsController < ApplicationController

  def index
    @rants = Rant.all
  end

  def new
    @rant = Rant.new
  end

  def create
    # Lines 9-12 different versions of lines 15 & 16:
    # @user = current_user
    # @rant = @user.rants.new(rant_params)

    # @rant = current_user.rants.new(rant_params)


    @rant = Rant.new(rant_params)
    @rant.user_id = current_user.id  # set the rant to the current_user
    if @rant.save
      redirect_to rants_path, notice: "Rant created"
    else
      render :new
    end
  end

  private

  def rant_params
    params.require(:rant).permit(:title, :body, :user_id)
  end


end
