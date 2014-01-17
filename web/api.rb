# encoding utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/mustache'
require_relative '../datos/init_datamapper'
require_relative '../negocio/usuario_service'
require_relative '../negocio/peticion_service'
require 'json'

class ServidorAPI < Sinatra::Base
  register Sinatra::Reloader

  get '/usuarios/:login' do
    @usuario = UsuarioService.new.listar_usuario(params[:login])
    content_type :json
    @usuario.to_json
  end

  get '/loginDisponible/:login' do
    disponible = login_disponible(params[:login])
    if(disponible)
      "OK"
    else
      "no"
    end
  end

  post '/usuarios' do
    usuario = JSON.parse(request.body.read)
    if(login_disponible(usuario[:login]))
      @usuario = UsuarioService.new.registrar_usuario(usuario)
      if(@usuario)
        content_type :json
        @usuario.to_json
      else
        status 400
      end
    else
      status 400
    end
  end

  post '/peticiones' do
    peticion = JSON.parse(request.body)
    @peticion = PeticionService.new.registrar_peticion(peticion)
    status 200
  end

private

  def login_disponible(login)
     usuario = UsuarioService.new.listar_usuario(login)
     usuario.nil?
  end

end