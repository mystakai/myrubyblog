class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, {notice: 'Your post was saved'}
    else
      @category = Category.all
      render :new
    end
  end

  def new
    @post = Post.new
    @category = Category.all
  end

  def edit
    @post = Post.find(params[:id])
    @category = Category.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path, {notice: 'Update Success!'}
    else
      @category = Category.all
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, {notice: 'Post Destryed.'}
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

end
