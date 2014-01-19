require_relative '../dominio/actualizacion'
require_relative '../dominio/peticion'

class ActualizacionDAO

  def listar_actualizaciones(id)
    a1 = Peticion.get(id)
    a1.actualizaciones.all()
  end

  def crear_actualizaciones(id, actualizaciones)
    a1 = Peticion.get(id)
    a1.actualizaciones.create(actualizaciones)
  end
end