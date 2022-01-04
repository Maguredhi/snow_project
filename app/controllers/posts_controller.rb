class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.publish! if params[:publish]

    if @post.save
      if params[:publish]
        redirect_to posts_path, notice: "發佈成功"
      else
        redirect_to edit_post_path(@post), notice: "儲存成功"
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      case
      when params[:publish]
        @post.publish!
        redirect_to posts_path, notice: "發佈成功"
      when params[:unpublish]
        @post.unpublish
        redirect_to posts_path, notice: "已下架"
      else
        redirect_to edit_post_path(@post), notice: "編輯成功"
      end
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "刪除成功"
  end

  private

  def find_post
    @post = current_user.posts.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :location, :content)
  end
end
