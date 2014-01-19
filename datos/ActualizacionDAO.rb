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

  def editar_actualizaciones(id, idact, actualizaciones)
    a = Peticion.get(id)
    a1 = a.actualizaciones.get(idact)
    a1.update(:contenido => actualizaciones["contenido"])
  end

  def borrar_actualizaciones(id, idact)
    a = Peticion.get(id)
    a1 = a.actualizaciones.get(idact)
    a1.destroy
  end

end