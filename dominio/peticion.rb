require 'data_mapper'
require 'date'

class Peticion
  include DataMapper::Resource

  property :id, Serial
  property :titulo, String, :required=>true
  property :texto, Text, :required=>true
  property :firmasObjetivo, Integer, :required=>true
  property :firmasConseguidas, Integer, :required=>true, :default => 0
  property :abierta, Boolean, :required=> true, :default => false
  property :conseguida, Boolean, :required=> true, :default => false
  property :destacada, Boolean, :required=> true, :default => false
  property :inicio, Date, :required=> true, :default => Date.today
  property :fin, Date, :required => true

  belongs_to :usuario

  alias :creador :usuario

  has n, :firmas, 'Firma'
  has n, :actualizaciones, 'Actualizacion'

end