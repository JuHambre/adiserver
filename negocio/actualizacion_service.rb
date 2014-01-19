require_relative '../datos/ActualizacionDAO'

class ActualizacionService

  def listar_actualizaciones(id)
    ActualizacionDAO.new.listar_actualizaciones(id)
  end

  def crear_actualizaciones(id, actualizaciones)
    ActualizacionDAO.new.crear_actualizaciones(id, actualizaciones)
  end
end