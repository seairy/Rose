# encoding: utf-8
class CkeditorPictureUploader < BaseUploader
  include Ckeditor::Backend::CarrierWave
  process :read_dimensions

  version :thumb do
    process :resize_to_fill => [118, 100]
  end

  version :content do
    process :resize_to_limit => [1800, 1350]
  end
end