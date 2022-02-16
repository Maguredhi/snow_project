class PagesController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def user
  end
end
