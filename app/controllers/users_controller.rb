class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_current_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    if logged_in?
      redirect_to posts_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
    @user_posts = Post.where(user_id: @user)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "アカウントを編集しました"
    else
      render 'edit'
    end
  end

  def favorites
    @user = User.find(params[:id])
    # @post = Post.find(params[:id])
    if @user.favorites
      @favorites = Favorite.where(user_id: session[:user_id]).order(created_at: :desc)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation,:image,:image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
