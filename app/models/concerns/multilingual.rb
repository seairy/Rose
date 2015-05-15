# -*- encoding : utf-8 -*-
module Multilingual extend ActiveSupport::Concern
  class_methods do
    def multilingual(*attributes)
      attributes.each do |attribute|
        define_method(attribute) do |locale|
          instance_eval("#{locale}_#{attribute}")
        end
      end
    end
  end
end