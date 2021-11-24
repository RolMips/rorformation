class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @filter=params[:filter]
    if @filter.nil?
        @posts = Post.includes(:category, :tags).all
      else
        @posts = Post.includes(:category, :tags).online(@filter).all
    end

  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, success: "Article modifié avec succès"
    else
      render 'edit'
    end
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.valid?
      post.save
      redirect_to posts_path, success: "Article ajouté avec succès"
    else
      @post = post
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: "Article supprimé avec succès"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :category_id, :online)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
