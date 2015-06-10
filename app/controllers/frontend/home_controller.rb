# -*- encoding : utf-8 -*-
class Frontend::HomeController < Frontend::BaseController
  def index
    @posts = Post.published.order(published_at: :desc)
  end
end