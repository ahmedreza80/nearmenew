require 'carrierwave/orm/activerecord'
require 'fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAINQFDTGSSJWRMA5Q",
      :aws_secret_access_key  => "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",
      :region                 => 'us-east-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "theddbucket"
end