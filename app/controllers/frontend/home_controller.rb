# -*- encoding : utf-8 -*-
class Frontend::HomeController < Frontend::BaseController
  def index
    @posts = Post.published.order(published_at: :desc).page(params[:page]).per(25)
    @popular_posts = Post.published.order(page_view: :desc).limit(24)
    @carousel_posts = Post.published.displayed_in_carousel.order(published_at: :desc)
    @recommended_posts = Post.published.displayed_in_recommended.order(published_at: :desc)
    @people_posts = Category.where(en_name: 'people').first.posts.published.limit(3)
    @place_posts = Category.where(en_name: 'places').first.posts.published.limit(3)
    @music_posts = Category.where(en_name: 'music').first.posts.published.limit(3)
    @speed_posts = Category.where(en_name: 'speed').first.posts.published.limit(3)
    @gallary_posts = Post.published.sample(8)
    @experts = Expert.limit(6)
  end
end