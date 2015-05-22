# encoding: utf-8
class PostCoverUploader < BaseUploader
  version :w1800_h1350_fl_q80 do
    process quality: 80
    process resize_to_fill: [1800, 1350]
  end

  version :w800_h600_fl_q80 do
    process quality: 80
    process resize_to_fill: [800, 600]
  end

  version :w640_h480_fl_q50 do
    process quality: 50
    process resize_to_fill: [640, 480]
  end

  version :w400_h300_fl_q80 do
    process quality: 80
    process resize_to_fill: [400, 300]
  end

  version :w160_h120_fl_q80 do
    process quality: 80
    process resize_to_fill: [160, 120]
  end
end