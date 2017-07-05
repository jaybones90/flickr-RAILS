class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(params[:id])
    if params[:delete_picture] == "true"
      @user.avatar = nil
      flash[:notice] = "You've successfully deleted your profile pic!"
      @user.save
      redirect_to edit_user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    session[:user_id] = nil
    user.destroy
    redirect_to root_path
    flash[:notice] = "You've successfully deleted your profile!"
  end


  private

  def user_params
    params.require(:user).permit(:avatar, :user_name, :email, :password, :password_confirmation)
  end
end
