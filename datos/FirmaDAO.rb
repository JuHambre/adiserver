require_relative '../dominio/firma'

class FirmaDAO
  def firma(firma)
    Firma.create(firma)
  end
end