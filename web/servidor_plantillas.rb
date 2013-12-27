# encoding utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/mustache'
require_relative '../datos/init_datamapper'
require_relative '../negocio/peticion_service'
require_relative '../negocio/usuario_service'

class ServidorPlantillas < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    'Hola Sinatra'
  end

  get '/index' do
    @destacadas = PeticionService.new.listar_destacadas
    mustache :index
  end

  get '/peticion' do
    @peticion = PeticionService.new.listar_peticion(params[:id])
    mustache :peticion
  end

  get '/usuario' do
    @usuario = UsuarioService.new.listar_usuario(params[:login])
    mustache :usuario
  end

  configure do
    'Arrancando la aplicacion...'
    init_datamapper
    Tilt.register Tilt::MustacheTemplate, 'html'
  end

end