# encoding utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/mustache'
require_relative '../datos/init_datamapper'

class ServidorAPI < Sinatra::Base
  register Sinatra::Reloader
end