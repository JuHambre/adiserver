ENV['RACK_ENV'] = 'test'

require_relative '../../web/autentificacion'
require_relative '../../datos/init_datamapper'
require 'test/unit'
require 'rack/test'

init_datamapper()

class ServidorAutentificacionTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    ServidorAutentificacion
  end

  def test_login
    post '/login', :login => 'pepe@ua.es', :password => 'pepe'
    assert last_response.ok?
  end

  def test_login_vacio
    post '/login', :login => '', :password => 'pepe'
    assert_equal last_response.status, 400
  end

  def test_login_incorrecto
    post '/login', :login => 'falso@ua.es', :password => 'falso'
    assert_equal last_response.status, 403
  end
end