require 'data_mapper'

class Peticion
  include DataMapper::Resource

  property :id, Serial
  property :titulo, String, :required=>true
  property :texto, Text, :required=>true
  property :firmasObjetivo, Integer, :required=>true
  property :firmasConseguidas, Integer, :required=>true
  property :abierta, Boolean, :required=> true
  property :conseguida, Boolean, :required=> true
  property :destacada, Boolean, :required=> true
  property :inicio, Date, :required => true
  property :fin, Date, :required => true

  belongs_to :usuario

  alias :creador :usuario

end