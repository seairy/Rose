# -*- encoding : utf-8 -*-
class Frontend::CategoriesController < Frontend::BaseController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.published.order(published_at: :desc).page(params[:page]).per(12)
  end
end