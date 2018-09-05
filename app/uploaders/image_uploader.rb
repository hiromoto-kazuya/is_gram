class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  process resize_to_limit: [600, 555]
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
