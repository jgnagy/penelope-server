# Standard Library Requirements

# External Requirements
require 'penelope/core'
require 'sinatra/base'
require 'tilt/erb'

# Internal Requirements
module Penelope
  module Server
    CONFIG = Core::CONFIG.merge(
      {
        redis: {
          host: ENV['PENELOPE_REDIS_HOST'] ? ENV['PENELOPE_REDIS_HOST'] : 'localhost',
          port: ENV['PENELOPE_REDIS_PORT'] ? ENV['PENELOPE_REDIS_PORT'] : '6379'
        }
      }
    )
  end
end

redis_config = Penelope::Server::CONFIG[:redis]
Resque.redis = "#{redis_config[:host]}:#{redis_config[:port]}"

require 'penelope/server/version'
require 'penelope/server/service'
