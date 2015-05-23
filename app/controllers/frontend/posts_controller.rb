# -*- encoding : utf-8 -*-
class Frontend::PostsController < Frontend::BaseController
  def show
    @post = Post.find(params[:id])
  end
end