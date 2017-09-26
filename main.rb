require 'bundler'
Bundler.require
require 'json'
require 'yaml'
require 'erb'
require 'cgi'

env = ENV['MIDORI_ENV'] ? ENV['MIDORI_ENV'] : 'development'

Dir[File.dirname(__FILE__) + '/routes/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/services/*.rb'].each { |file| require file }

Midori::Configure.before = proc do
  db_config = YAML.load(ERB.new(File.read('config/db.yml')).result)[env]
  DB = Sequel.connect(db_config)
  Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
end

class Route < Midori::API
  env = ENV['MIDORI_ENV'] ? ENV['MIDORI_ENV'] : 'development'
  mount '/user', UserRoute
  mount '/task', TaskRoute
  mount('', AppRoute) if env == 'development' # Static file for development
  mount '_', ErrorRoute
end

Midori::Configure.set :bind, '0.0.0.0'
Midori::Configure.set :port, ENV['PORT']

Midori::Runner.new(Route).start
