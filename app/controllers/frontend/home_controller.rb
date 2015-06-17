# -*- encoding : utf-8 -*-
class Frontend::HomeController < Frontend::BaseController
  def index
    @posts = Post.published.order(published_at: :desc).page(params[:page]).per(25)
    @popular_posts = Post.published.order(page_view: :desc).limit(24)
    @carousel_posts = Post.published.displayed_in_carousel.order(published_at: :desc)
    @recommended_posts = Post.published.displayed_in_recommended.order(published_at: :desc)
    @gallary_posts = Post.published.sample(8)
  end
end