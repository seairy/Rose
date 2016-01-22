# -*- encoding : utf-8 -*-
class Cms::PostsController < Cms::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish, :trash, :restore]
  
  def index
    @posts = Post.order(published_at: :desc).page(params[:page]).per(40)
  end
  
  def show
  end
  
  def new
    @post = Post.new
  end
  
  def edit
  end
  
  def create
    @post = Post.new(post_params)
    @post.published_at = convert_picker_to_datetime(post_params[:published_at_date], post_params[:published_at_time])
    if @post.save
      redirect_to [:cms, @post], notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def update
    @post.published_at = convert_picker_to_datetime(post_params[:published_at_date], post_params[:published_at_time])
    if @post.update(post_params)
      redirect_to [:cms, @post], notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    redirect_to cms_posts_path, notice: 'Post was successfully destroyed.'
  end

  def draft
    @posts = Post.draft.order(published_at: :desc).page(params[:page]).per(40)
  end

  def published
    @posts = Post.published.order(published_at: :desc).page(params[:page]).per(40)
  end

  def trashed
    @posts = Post.trashed.order(published_at: :desc).page(params[:page]).per(40)
  end

  def publish
    @post.publish!
    redirect_to [:cms, @post], notice: 'Post was successfully published.'
  end

  def trash
    @post.trash!
    redirect_to [:cms, @post], notice: 'Post was successfully trashed.'
  end

  def restore
    @post.restore!
    redirect_to [:cms, @post], notice: 'Post was successfully restored.'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit!
    end
end
