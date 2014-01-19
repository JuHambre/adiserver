require_relative '../datos/ActualizacionDAO'

class ActualizacionService

  def listar_actualizaciones(id)
    ActualizacionDAO.new.listar_actualizaciones(id)
  end

  def crear_actualizaciones(id, actualizaciones)
    ActualizacionDAO.new.crear_actualizaciones(id, actualizaciones)
  end

  def editar_actualizaciones(id, idact, actualizaciones)
    ActualizacionDAO.new.editar_actualizaciones(id, idact, actualizaciones)
  end

  def borrar_actualizaciones(id, idact)
    ActualizacionDAO.new.borrar_actualizaciones(id, idact)
  end
end