# encoding utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/mustache'
require_relative '../datos/init_datamapper'
require_relative '../negocio/usuario_service'
require_relative '../negocio/peticion_service'
require_relative '../negocio/firma_service'
require_relative '../negocio/actualizacion_service'
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
    if(login_disponible(usuario["login"]))
      @usuario = UsuarioService.new.registrar_usuario(usuario)
    else
      status 400
    end
  end

  post '/peticiones' do
    peticion = JSON.parse(request.body.read)
    if(session[:login])
      if(peticion["titulo"] != "" && peticion["texto"] != "" && peticion["firmasObjetivo"] != "" && peticion["fin"] != "")
        @peticion = PeticionService.new.registrar_peticion(peticion,session[:login])
      else
        status 400
      end
    else
      status 403
    end
  end

  post '/peticiones/:id/firmas' do
    firma = JSON.parse(request.body.read)
    @firma = FirmaService.new.firma(firma,params[:id])
  end

  get '/peticiones/:id/actualizaciones' do
    @actualizaciones = ActualizacionService.new.listar_actualizaciones(params[:id])
    content_type :json
    @actualizaciones.to_json
  end

  post '/peticiones/:id/actualizaciones' do
    actualizaciones = JSON.parse(request.body.read)
    @actualizaciones = ActualizacionService.new.crear_actualizaciones(params[:id], actualizaciones)
  end

private

  def login_disponible(login)
     usuario = UsuarioService.new.listar_usuario(login)
     usuario.nil?
  end

end