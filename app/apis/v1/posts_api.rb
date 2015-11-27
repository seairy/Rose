# -*- encoding : utf-8 -*-
module V1
  module Posts
    module Entities
      class List < Grape::Entity
        expose :id
        expose :cover do |m, o|
          oss_image(m, :cover, :w160_h120_fl_q80)
        end
        expose :title do |m, o|
          m.zh_title
        end
        expose :description do |m, o|
          m.zh_home_description
        end
        expose :published_at
      end

      class Detail < Grape::Entity
        expose :title do |m, o|
          m.zh_title
        end
        expose :content do |m, o|
          m.zh_content
        end
      end
    end
  end

  class PostsAPI < Grape::API
    resources :posts do
      params do
        optional :page, type: Integer
      end
      get do
        posts = Post.published.latest.page(params[:page]).per(20)
        present posts, with: Posts::Entities::List
      end

      params do
        requires :id, type: Integer
      end
      get '/:id' do
        begin
          post = Post.find(params[:id])
          present post, with: Posts::Entities::Detail
        rescue ActiveRecord::RecordNotFound
          api_error!(10002)
        end
      end
    end
  end
end
