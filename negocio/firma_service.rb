require_relative '../datos/FirmaDAO'

class FirmaService
  def firma(firma,id)
    FirmaDAO.new.firma(firma,id)
  end
end