require_relative '../dominio/usuario'

class UsuarioDAO
  def listar_usuario(login)
    Usuario.get(login)
  end

  def login(email, password)
    Usuario.first(:password => password)
  end
end