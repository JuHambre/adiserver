require_relative '../datos/FirmaDAO'

class FirmaService
  def firma(firma,id)
    firma[:peticion] = params
    FirmaDAO.new.firma(firma,id)
  end
end