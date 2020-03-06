require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :fog
  elsif Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: 'ap-northeast-1'
    }

    config.fog_directory  = '19900410ms'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/19900410ms'
  end
end