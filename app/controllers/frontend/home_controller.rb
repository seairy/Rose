# -*- encoding : utf-8 -*-
class Frontend::HomeController < Frontend::BaseController
  def index
    @posts = Post.all
  end

  def index_new
    @posts = Post.all
    render layout: false
  end
end