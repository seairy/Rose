# -*- encoding : utf-8 -*-
class Frontend::CategoriesController < Frontend::BaseController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.published
    @carousel_posts = @category.posts.published.sample(8)
    @gallary_posts = Post.published.sample(8)
    @archive_posts = Post.published.order(:published_at).limit(24)
  end
end