# encoding: utf-8
class MagazineCoverUploader < BaseUploader
  version :w1300_h1850_fl_q80 do
    process quality: 80
    process resize_to_fill: [1300, 1850]
  end

  version :w600_h800_fl_q80 do
    process quality: 80
    process resize_to_fill: [600, 800]
  end

  version :w300_h400_fl_q80 do
    process quality: 80
    process resize_to_fill: [300, 400]
  end
end