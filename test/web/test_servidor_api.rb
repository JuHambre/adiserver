ENV['RACK_ENV'] = 'test'

require_relative '../../web/api'
require_relative '../../datos/init_datamapper'
require 'test/unit'
require 'rack/test'

init_datamapper()

class ServidorAPITest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    ServidorAPI
  end

  def test_get_usuario
    get '/usuarios/pepe@ua.es'
    assert last_response.ok?
    assert last_response.body.include?('Pepe')
  end
end
