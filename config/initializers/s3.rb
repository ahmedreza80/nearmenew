require 'carrierwave/orm/activerecord'
require 'fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => "AKIAIYJUM5J5PVD5INIQ",
      :aws_secret_access_key  => "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",
      :region                 => 'us-east-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "theddbucket"
end