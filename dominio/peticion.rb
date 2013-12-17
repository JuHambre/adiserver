require 'data_mapper'

class Peticion
  include DataMapper::Resource

  property :id, Serial
  property :titulo, String
  property :firmasConseguidas, Integer
  property :destacada, Boolean
  #faltan muchos campos!!!

  belongs_to :usuario

end