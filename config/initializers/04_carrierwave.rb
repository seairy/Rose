# -*- encoding : utf-8 -*-
CarrierWave.configure do |config|
  config.storage = :qiniu
  config.qiniu_access_key = Setting.key[:qiniu_oss][:access_key]
  config.qiniu_secret_key = Setting.key[:qiniu_oss][:secret_key]
  config.qiniu_bucket = Setting.key[:qiniu_oss][:bucket]
  config.qiniu_bucket_domain = Setting.key[:qiniu_oss][:bucket_domain]
  config.qiniu_up_host = 'http://up.qiniug.com'
end