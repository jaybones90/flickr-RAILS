class ImagesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @images = @user.images
  end

  def show
    @user = User.find(params[:user_id])
    @image = @user.images.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    image = @user.images.new(image_params)
    if image.save
      flash[:notice] = "Image added successfully"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Something Went Wrong. Please Try Again"
      redirect_to user_path(@user)
    end
  end

private
  def image_params
    params.require(:image).permit(:avatar, :caption, :private)
  end



end
