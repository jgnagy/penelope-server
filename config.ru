require 'penelope/server'
require 'resque/server'

use Rack::ShowExceptions

run Rack::URLMap.new \
  '/'     => Penelope::Server::Service.new,
  '/qmon' => Resque::Server.new
