# -*- encoding : utf-8 -*-
class Frontend::SearchesController < Frontend::BaseController
  def create
    @posts = Post.search(params[:keyword])
    render 'result'
  end
end