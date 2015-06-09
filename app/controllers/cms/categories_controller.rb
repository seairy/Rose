# -*- encoding : utf-8 -*-
class Cms::CategoriesController < Cms::BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.page(params[:page])
  end
  
  def show
  end
  
  def new
    @category = Category.new
  end
  
  def edit
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:cms, @category], notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def update
    if @category.update(category_params)
      redirect_to [:cms, @category], notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @category.destroy
    redirect_to cms_categories_path, notice: 'Category was successfully destroyed.'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit!
    end
end