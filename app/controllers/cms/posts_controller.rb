# -*- encoding : utf-8 -*-
class Cms::PostsController < Cms::BaseController
  
  def index
    @posts = Post.page(params[:page])
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to [:cms, @post], notice: '创建成功！'
    else
      render action: 'new'
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to [:cms, @post], notice: '更新成功！'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.trash
    redirect_to cms_posts_path, notice: '删除成功！'
  end

  protected
  def post_params
    params.require(:post).permit!
  end
end
