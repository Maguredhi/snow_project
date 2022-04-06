class PagesController < ApplicationController
  def index
    @posts = Post.order(updated_at: :desc).includes(:user)
  end

  def show
  end

  def user
  end
end
