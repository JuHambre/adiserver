require './servidor_plantillas'

map "/muevete" do
  run ServidorPlantillas  #Nombre de la clase que implementa la parte de Mustache
end