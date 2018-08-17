class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿が完了しました"
    else
      render'new'
    end
  end

  def show
  end

  def edit
  end

  def update

    if @post.update(post_params)
      redirect_to posts_path, notice: "編集が完了しました"
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
    params.require(:post).permit(:title,:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end


end
