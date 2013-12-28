require_relative '../dominio/usuario'

class UsuarioDAO
  def listar_usuario(login)
    Usuario.get(login)
  end

  def login(email, password)
    Usuario.first(:password => password)
  end

  def registrar_usuario(usuario)
    if Usuario.create(usuario)
      listar_usuario(usuario[:login])
    else
      false
    end
  end
end