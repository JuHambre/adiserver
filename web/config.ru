require './servidor_plantillas'
require './autentificacion'
require './api'

map "/muevete" do
  run ServidorPlantillas  #Nombre de la clase que implementa la parte de Mustache
end

map "/muevete/auth" do
  use Rack::Session::Cookie
  run ServidorAutentificacion
end

map "/muevete/api" do
  use Rack::Session::Cookie
  run ServidorAPI
end