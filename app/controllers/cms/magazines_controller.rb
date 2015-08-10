# -*- encoding : utf-8 -*-
class Cms::MagazinesController < Cms::BaseController
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]
  
  def index
    @magazines = Magazine.page(params[:page])
  end
  
  def show
  end
  
  def new
    @magazine = Magazine.new
  end
  
  def edit
  end
  
  def create
    @magazine = Magazine.new(magazine_params)
    if @magazine.save
      redirect_to [:cms, @magazine], notice: 'Magazine was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def update
    if @magazine.update(magazine_params)
      redirect_to [:cms, @magazine], notice: 'Magazine was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @magazine.destroy
    redirect_to cms_magazines_path, notice: 'Magazine was successfully destroyed.'
  end

  private
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    def magazine_params
      params.require(:magazine).permit!
    end
end
