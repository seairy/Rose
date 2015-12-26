# -*- encoding : utf-8 -*-
class Wechat::PostsController < Wechat::BaseController
  def show
    @post = Post.find(params[:id])
    @post.visit!
  end
end