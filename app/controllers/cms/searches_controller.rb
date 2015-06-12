# -*- encoding : utf-8 -*-
class Cms::SearchesController < Cms::BaseController
  
  def show
    @posts = Post.search(params[:keyword]).page(params[:page])
  end
end
