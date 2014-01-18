require_relative '../dominio/peticion'
require_relative '../dominio/usuario'

class PeticionDAO
  def listar_destacadas()
    Peticion.all(:destacada=>true)
  end

  def listar_peticion(id)
    Peticion.get(id)
  end

  def registrar_peticion(peticion,login)
    u1 = Usuario.get(login)
    u1.peticiones.create(peticion)
  end
end