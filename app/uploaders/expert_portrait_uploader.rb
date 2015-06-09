# encoding: utf-8
class ExpertPortraitUploader < BaseUploader
  version :w255_h340_fl_q80 do
    process quality: 80
    process resize_to_fill: [255, 340]
  end
end