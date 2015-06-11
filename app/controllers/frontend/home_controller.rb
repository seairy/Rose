# -*- encoding : utf-8 -*-
class Frontend::HomeController < Frontend::BaseController
  def index
    @posts = Post.published.order(published_at: :desc)
    @gallary_posts = Post.published.sample(8)
    @archive_posts = Post.published.order(:published_at).limit(24)
  end
end