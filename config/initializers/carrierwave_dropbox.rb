CarrierWave.configure do |config|
  config.dropbox_app_key = Settings.dropbox.app_key
  config.dropbox_app_secret = Settings.dropbox.app_secret
  config.dropbox_access_token = Settings.dropbox.access_token
  config.dropbox_access_token_secret = Settings.dropbox.access_token_secret
  config.dropbox_user_id = Settings.dropbox.user_id
  config.dropbox_access_type = Settings.dropbox.access_type
end