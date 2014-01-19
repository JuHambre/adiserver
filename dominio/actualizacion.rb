require 'data_mapper'
require 'date'

class Actualizacion
  include DataMapper::Resource

  property :id, Serial
  property :contenido, Text, :required=>true
  property :fecha, Date, :required=> true, :default => Date.today

  belongs_to :peticion

end