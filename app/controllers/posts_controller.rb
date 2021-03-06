class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :check_user_login_status, only:[:index, :new, :edit, :show, :destroy]

  def index
    @following_posts = Post.where(user_id: current_user.following)
    @myposts = Post.where(user_id: current_user.id)
    @posts = Post.where(id: @following_posts + @myposts ).order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
      raise
    else
      @post = Post.new
    end
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    render :new if @post.invalid?
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    PostMailer.post_mail(@post).deliver
      redirect_to posts_path, notice: "投稿が完了しました"
    else
      render'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(id: @post.id), notice: "編集が完了しました"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除しました"
  end

  private
  def post_params
    params.require(:post).permit(:title,:content,:user_id,:image,:image_cache)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
