require 'rack'
require 'rack/lobster'
require_relative 'chaese'

use Chaese
run Rack::Lobster.new
