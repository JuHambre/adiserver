require_relative '../datos/PeticionDAO'

class PeticionService
  def listar_destacadas()
    PeticionDAO.new.listar_destacadas
  end

  def listar_peticion(id)
    PeticionDAO.new.listar_peticion(id)
  end
end