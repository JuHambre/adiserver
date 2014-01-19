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

  ## Loguear
  get '/usuarios/:login' do
    @usuario = UsuarioService.new.listar_usuario(params[:login])
    content_type :json
    @usuario.to_json ## Devolvemos el usuario en formato json
  end

  ## Comprobamos si el login esta disponible
  get '/loginDisponible/:login' do
    disponible = login_disponible(params[:login])
    if(disponible)
      "OK"
    else
      "no"
    end
  end

  ## Registrar
  post '/usuarios' do
    usuario = JSON.parse(request.body.read)
    if(login_disponible(usuario["login"]))
      @usuario = UsuarioService.new.registrar_usuario(usuario)
      headers['Location'] = '/muevete/usuario?login=a' + usuario["login"] ## Devolvemos direccion
    else
      status 400
    end
  end

  ## Crear peticiones
  post '/peticiones' do
    peticion = JSON.parse(request.body.read)
    if(session[:login]) ## Comprobamos si el usuario esta logueado
      if(peticion["titulo"] != "" && peticion["texto"] != "" && peticion["firmasObjetivo"] != "" && peticion["fin"] != "") ## Comprobamos que no hayan campos vacios
        @peticion = PeticionService.new.registrar_peticion(peticion,session[:login])
        headers['Location'] = '/muevete/peticion?id='+@peticion["id"].to_s ## Devolvemos direccion pero primero hay que convertir a String
      else
        status 400
      end
    else
      status 403
    end
  end

  ## Crear firmas
  ## Para probar estando logueado solo se muestran dos campos hay que loguear desde peticiones
  post '/peticiones/:id/firmas' do
    firma = JSON.parse(request.body.read)
    if(firma["comentario"] != "") ## Comprobamos que el campo comentario no este avcio
      @firma = FirmaService.new.firma(firma,params[:id])
    else
      status 400
    end
  end

  ## Crear actualizaciones
  ## He permitido que aunque no estes logueado puedas tanto crear, modificar, y borrar peticiones
  get '/peticiones/:id/actualizaciones' do
    @actualizaciones = ActualizacionService.new.listar_actualizaciones(params[:id])
    content_type :json
    @actualizaciones.to_json ## Hay que mostrarlas en formato JSON
  end

  ## Crear actualizaciones
  post '/peticiones/:id/actualizaciones' do
    actualizaciones = JSON.parse(request.body.read)
    @actualizaciones = ActualizacionService.new.crear_actualizaciones(params[:id], actualizaciones)
    headers['Location'] = '/muevete/api/peticiones/'+params[:id]+'/actualizaciones' ## Devolvemos location con todas las actualizaciones
    content_type :json
    @actualizaciones.to_json ## Devolvemos en JSON
  end

  ## Editar actualizaciones
  put '/peticiones/:id/actualizaciones/:idact' do
    actualizaciones = JSON.parse(request.body.read)
    @actualizaciones = ActualizacionService.new.editar_actualizaciones(params[:id], params[:idact], actualizaciones)
  end

  ## Borrar actualizaciones
  delete '/peticiones/:id/actualizaciones/:idact' do
    @actualizaciones = ActualizacionService.new.borrar_actualizaciones(params[:id], params[:idact])
  end

private

  ## Compprobamos si el login esta disponible
  def login_disponible(login)
     usuario = UsuarioService.new.listar_usuario(login)
     usuario.nil?
  end

end