require 'data_mapper'

class Firma
  include DataMapper::Resource

  property :id, Serial
  property :nombre, String, :required=>true
  property :apellidos, String, :required=>true
  property :email, String, :required=>true
  property :publica, Boolean, :required=>true
  property :comentario, Text, :required=>true

  belongs_to :peticion

end