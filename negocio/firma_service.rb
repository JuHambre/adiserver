require_relative '../datos/FirmaDAO'

class FirmaService
  def firma(firma)
    FirmaDAO.new.firma(firma)
  end
end