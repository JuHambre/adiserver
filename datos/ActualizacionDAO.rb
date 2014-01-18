require_relative '../dominio/actualizacion'

class ActualizacionDAO
  def listar_actualizaciones()
    Actualizacion.all()
  end
end