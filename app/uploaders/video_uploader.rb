# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video

  process encode_video: [:mp4, resolution: :same, custom: '-strict experimental -acodec aac',
                         watermark: {
                            path: File.join(Rails.root, "app", "assets", "images", "wm.jpg"),
                            position: :bottom_right, # also: :top_right, :bottom_left, :bottom_right
                            pixels_from_edge: 15
                         }
  ]

  #process :encode_by_file_extension

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  def encode_by_file_extension
    ext = model.title.rpartition('.')[2].to_sym
    encode_video(ext, custom: '-strict experimental -acodec mp3')
                      # , resolution: :same  # -vcodec libx264 -acodec vorbis -s 800x600  -qscale 0 -preset slow -g 30

  end

  # Choose what kind of storage to use for this uploader:
  storage :dropbox
  # storage :fog or :file or ...

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "videos"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
     model.title if original_filename
  end

end
