class RantsController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @rants = Rant.all
    @rants = Rant.search(params[:search])
    if @rants.count < 1
      flash[:notice] = "These are not the droids you are looking for."
      render :index
    end
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

  def edit
    @rant = Rant.find(params[:id])
    render :edit
  end

  def update
    @rant = Rant.find(params[:id])
    if @rant.update(rant_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to root_path
  end

  private

  def rant_params
    params.require(:rant).permit(:title, :body, :user_id)
  end

  def correct_user
    @rant = current_user.rants.find_by(id: params[:id])
    redirect_to root_path, notice: "Not authorized to edit this rant" if @rant.nil?
  end

end
