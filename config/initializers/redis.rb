# if ENV["'redis://rediscloud:HJ2V7621lEUMMrhNNbPVwmKVRvracr8R@redis-17478.c6.eu-west-1-1.ec2.cloud.redislabs.com:17478'"]
#   $redis = Redis.new(:url => ENV["'redis://rediscloud:HJ2V7621lEUMMrhNNbPVwmKVRvracr8R@redis-17478.c6.eu-west-1-1.ec2.cloud.redislabs.com:17478'"])
# endr
ENV["REDISTOGO_URL"] = 'redis://rediscloud:HJ2V7621lEUMMrhNNbPVwmKVRvracr8R@redis-17478.c6.eu-west-1-1.ec2.cloud.redislabs.com:17478'
uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:url => uri)