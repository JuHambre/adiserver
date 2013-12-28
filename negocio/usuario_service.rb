require_relative '../datos/UsuarioDAO'

class UsuarioService
  def listar_usuario(login)
    UsuarioDAO.new.listar_usuario(login)
  end

  def login(email, password)
    if(email == '' || password == '')
      raise ArgumentError
    else
      UsuarioDAO.new.login(email, password)
    end
  end

  def registrar_usuario(usuario)
    UsuarioDAO.new.registrar_usuario(usuario)
  end

end