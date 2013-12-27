require_relative '../datos/UsuarioDAO'

class UsuarioService
  def listar_usuario(login)
    UsuarioDAO.new.listar_usuario(login)
  end
end