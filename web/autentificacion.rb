# encoding utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/mustache'
require_relative '../datos/init_datamapper'
require_relative '../negocio/usuario_service'

class ServidorAutentificacion < Sinatra::Base
  register Sinatra::Reloader

  post '/login' do
    begin
      @login = UsuarioService.new.login(params[:login], params[:password])

      if(@login)
        session[:login] = params[:login]
        status 200
      else
        status 403
      end
    rescue ArgumentError
      status 400
    end
  end

  get '/logout' do
    session.clear
  end

end