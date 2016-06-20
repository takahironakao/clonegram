class PostsController < ApplicationController
  
  before_action :set_post, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render action: 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to posts_path, notice: "更新しました！"
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除しました！"
  end
  
  private
    def posts_params
      params.require(:post).permit(:title)
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
end