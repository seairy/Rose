# encoding: utf-8
class ExpertPortraitUploader < BaseUploader
  version :w340_h340_fl_q80 do
    process quality: 80
    process resize_to_fill: [340, 340]
  end

  version :w255_h340_fl_q80 do
    process quality: 80
    process resize_to_fill: [255, 340]
  end
end