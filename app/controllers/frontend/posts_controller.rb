# -*- encoding : utf-8 -*-
class Frontend::PostsController < Frontend::BaseController
  def show
    @post = Post.find(params[:id])
    @posts = Post.published
    @archive_posts = Post.published.order(:published_at).limit(24)
  end
end