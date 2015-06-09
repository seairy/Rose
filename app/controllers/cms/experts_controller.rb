# -*- encoding : utf-8 -*-
class Cms::ExpertsController < Cms::BaseController
  before_action :set_expert, only: [:show, :edit, :update, :destroy]
  
  def index
    @experts = Expert.page(params[:page])
  end
  
  def show
  end
  
  def new
    @expert = Expert.new
  end
  
  def edit
  end
  
  def create
    @expert = Expert.new(expert_params)
    if @expert.save
      redirect_to [:cms, @expert], notice: 'Expert was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def update
    if @expert.update(expert_params)
      redirect_to [:cms, @expert], notice: 'Expert was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @expert.destroy
    redirect_to cms_experts_path, notice: 'Expert was successfully destroyed.'
  end

  private
    def set_expert
      @expert = Expert.find(params[:id])
    end

    def expert_params
      params.require(:expert).permit!
    end
end
