CarrierWave.configure do |config|
  config.fog_credentials = {
    persistent:            false,
    provider:              'AWS',
    aws_access_key_id:     ENV["STORAGE_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["STORAGE_SECRET_ACCESS_KEY"],
    region:                ENV["STORAGE_REGION"]                     # optional, defaults to 'us-east-1'
    # hosts:                 's3.example.com'              # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  
  config.fog_directory = ENV['STORAGE_BUCKET_NAME']
  config.cache_dir = "#{Rails.root}/tmp/uploads" # disable local cache for persistance through form redisplays so heroku works
  # config.max_file_size = 200.megabytes
end