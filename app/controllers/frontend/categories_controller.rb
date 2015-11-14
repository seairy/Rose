# -*- encoding : utf-8 -*-
class Frontend::CategoriesController < Frontend::BaseController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.published.page(params[:page]).per(12)
  end
end