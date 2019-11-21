class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 256, 256
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end

  version :user_photo_main do
    cloudinary_transformation radius: 0,
      width: 160, height: 160, crop: :thumb, gravity: :face
  end

  version :dashboard_avatar do
    cloudinary_transformation gravity: :face, crop: :thumb, width: 40, height: 40, radius: :max
  end
end
