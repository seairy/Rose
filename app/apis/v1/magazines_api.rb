# -*- encoding : utf-8 -*-
module V1
  module Magazines
    module Entities
      class List < Grape::Entity
        expose :id
        expose :cover do |m, o|
          oss_image(m, :cover, :w600_h800_fl_q80)
        end
        expose :issue do |m, o|
          m.zh_issue
        end
        expose :description do |m, o|
          m.zh_description
        end
      end
    end
  end

  class MagazinesAPI < Grape::API
    resources :magazines do
      get do
        magazines = Magazine.all
        present magazines, with: Magazines::Entities::List
      end
    end
  end
end