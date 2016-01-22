# -*- encoding : utf-8 -*-
module V1
  module Experts
    module Entities
      class List < Grape::Entity
        expose :id
        expose :portrait do |m, o|
          oss_image(m, :portrait, :w340_h340_fl_q80)
        end
        expose :en_name
        expose :zh_name
        expose :description do |m, o|
          m.zh_description
        end
      end

      class Detail < Grape::Entity
        expose :portrait do |m, o|
          oss_image(m, :portrait, :w340_h340_fl_q80)
        end
        expose :en_name
        expose :zh_name
        expose :description do |m, o|
          m.zh_description
        end
      end
    end
  end

  class ExpertsAPI < Grape::API
    resources :experts do
      get do
        experts = Expert.all
        present experts, with: Experts::Entities::List
      end

      params do
        requires :id, type: Integer
      end
      get '/:id' do
        begin
          expert = Expert.find(params[:id])
          present expert, with: Experts::Entities::Detail
        rescue ActiveRecord::RecordNotFound
          api_error!(10002)
        end
      end
    end
  end
end