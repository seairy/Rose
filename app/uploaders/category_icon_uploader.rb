# encoding: utf-8
class CategoryIconUploader < BaseUploader
  version :w100_h100_ft_q80 do
    process quality: 80
    process resize_to_fit: [100, 100]
  end
end