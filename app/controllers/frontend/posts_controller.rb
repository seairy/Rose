# -*- encoding : utf-8 -*-
class Frontend::PostsController < Frontend::BaseController
  def show
    @post = Post.find(params[:id])
    @post.visit!
    @posts = Post.published
    @recent_posts = Post.published.order(published_at: :desc).limit(12)
  end
end