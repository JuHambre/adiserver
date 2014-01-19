# encoding utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/mustache'
require_relative '../datos/init_datamapper'
require_relative '../negocio/peticion_service'
require_relative '../negocio/usuario_service'

class ServidorPlantillas < Sinatra::Base
  register Sinatra::Reloader

  ## Prueba de que funciona sinatra
  get '/' do
    'Hola Sinatra'
  end

  ## Vista index
  get '/index' do
    @destacadas = PeticionService.new.listar_destacadas
    mustache :index
  end

  ## Vista peticion
  get '/peticion' do
    @peticion = PeticionService.new.listar_peticion(params[:id])
    mustache :peticion
  end

  ## Vista usuario
  get '/usuario' do
    @usuario = UsuarioService.new.listar_usuario(params[:login])
    mustache :usuario
  end

  ## Para poder utilizar mustache
  configure do
    'Arrancando la aplicacion...'
    init_datamapper
    Tilt.register Tilt::MustacheTemplate, 'html'
  end

end