require_relative '../datos/ActualizacionDAO'

class ActualizacionService
  def listar_actualizaciones()
    ActualizacionDAO.new.listar_actualizaciones()
  end
end