# encoding utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/mustache'
require_relative '../datos/init_datamapper'
require_relative '../negocio/usuario_service'

class ServidorAPI < Sinatra::Base
  register Sinatra::Reloader

  get '/usuarios/:login' do
    @usuario = UsuarioService.new.listar_usuario(params[:login])
    content_type :json
    @usuario.to_json
  end

  get '/loginDisponible/:login' do
    @usuario = UsuarioService.new.listar_usuario(params[:login])
    if(@usuario)
      "no"
    else
      "OK"
    end
  end

end