require_relative '../dominio/peticion'

class PeticionDAO
  def listar_destacadas()
    Peticion.all(:destacada=>true)
  end

  def listar_peticion(id)
    Peticion.get(id)
  end

  def registrar_peticion(peticion)
    Peticion.create(peticion)
  end
end