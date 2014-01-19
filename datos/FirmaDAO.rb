require_relative '../dominio/firma'
require_relative '../dominio/peticion'

class FirmaDAO
  def firma(firma,id)
    p1 = Peticion.get(id)
    p1.firmas.create(firma)
  end
end