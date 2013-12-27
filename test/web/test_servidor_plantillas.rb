ENV['RACK_ENV'] = 'test'

require_relative '../../web/servidor_plantillas'
require_relative '../../datos/init_datamapper'
require 'test/unit'
require 'rack/test'

class ServidorPlantillasTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    ServidorPlantillas
  end

  def test_funciona_servidor
    get '/'
    assert last_response.ok?
    assert_equal 'Hola Sinatra', last_response.body
  end

  def test_pagina_inicio
    get '/index'
    assert last_response.ok?
    assert last_response.body.include?('Batcueva')
    assert last_response.body.include?('peticion 1')
  end

  def test_peticiones
    get '/peticion?id=1'
    assert last_response.ok?
    assert last_response.body.include?('peticion 1')
    assert last_response.body.include?('Firmas recientes')
  end
end