class Movie < ActiveRecord::Base
  mount_uploader :video, VideoUploader
end
