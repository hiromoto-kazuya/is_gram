class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render'new'
    end
  end

  def show
    @user = User.find(params[:id])

  end

  # 保留 def edit

  # end

  def favorites
    @user = User.find(params[:id])
    if @user.favorites
      @favorites = Favorite.where(user_id: session[:user_id])
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation,:image,:image_cache)
  end
end
