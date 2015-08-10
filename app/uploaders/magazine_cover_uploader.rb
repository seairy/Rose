# encoding: utf-8
class MagazineCoverUploader < BaseUploader
  version :w800_h600_fl_q80 do
    process quality: 80
    process resize_to_fill: [800, 600]
  end

  version :w160_h120_fl_q80 do
    process quality: 80
    process resize_to_fill: [160, 120]
  end
end