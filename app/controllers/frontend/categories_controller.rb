# -*- encoding : utf-8 -*-
class Frontend::CategoriesController < Frontend::BaseController
  def show
    @category = Category.find(params[:id])
    @posts = Post.all
  end
end