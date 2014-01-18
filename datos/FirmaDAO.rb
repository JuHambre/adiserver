require_relative '../dominio/firma'

class FirmaDAO
  def firma(firma,id)
    firma[:peticion] = id
    Firma.create(firma)
  end
end