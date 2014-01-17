require_relative '../datos/PeticionDAO'

class PeticionService
  def listar_destacadas()
    PeticionDAO.new.listar_destacadas
  end

  def listar_peticion(id)
    PeticionDAO.new.listar_peticion(id)
  end

  def registrar_peticion(peticion)
    PeticionDAO.new.registrar_peticion(peticion)
  end
end