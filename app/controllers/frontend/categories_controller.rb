# -*- encoding : utf-8 -*-
class Frontend::CategoriesController < Frontend::BaseController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.published.page(params[:page]).per(25)
    @popular_posts = @category.posts.published.order(page_view: :desc).limit(24)
    @carousel_posts = @category.posts.published.sample(8)
    @recommended_posts = Post.published.displayed_in_recommended.order(published_at: :desc)
    @gallary_posts = Post.published.sample(8)
    @archive_posts = Post.published.order(:published_at).limit(24)
  end
end