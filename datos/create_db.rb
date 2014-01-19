# encoding: utf-8
require 'data_mapper'
require 'date'

require_relative '../dominio/actualizacion'
require_relative '../dominio/firma'
require_relative '../dominio/peticion'
require_relative '../dominio/usuario'

require_relative 'init_datamapper'

def init_data

  Actualizacion.destroy
  Firma.destroy
  Peticion.destroy
  Usuario.destroy

texto1 = <<END
Desde tiempos inmemoriales los humanos han cazado a los berberechos sin piedad.
Ya basta. Los berberechos deben ser libres.
Porque los berberechos tienen derechos: Rajoy, promueve una Ley de Protección del Berberecho Salvaje')
END


texto2 = <<END
Estamos hartos de tantas prácticas de ADI, por lo que proponemos un sobresaliente general o en su defecto aprobado
END

texto3 = <<END
Prueba 1
END

texto4 = <<END
Prueba 2
END


  u1 = Usuario.create(:login => 'adi@ua.es', :password => 'adi', :nombre => 'Alfonso', :apellidos => 'David Iradier')
  u1.peticiones.create({:titulo =>'Que se proteja al berberecho salvaje',
                        :texto => texto1,
                        :firmasObjetivo => 1000,
                        :firmasConseguidas => 0,
                        :abierta =>true,
                        :conseguida => true,
                        :destacada => true,
                        :inicio => Date.today,
                        :fin => Date.today+60})
  u2 = Usuario.create(:login => 'pepe@ua.es', :password => 'pepe',
                      :nombre => 'Pepe', :apellidos => 'Pérez Martínez')
  u2.peticiones.create(:titulo =>'No queremos más prácticas de ADI',
                       :texto => texto2,
                       :firmasObjetivo => 1000,
                       :firmasConseguidas => 0,
                       :abierta =>true,
                       :conseguida => true,
                       :destacada => true,
                       :inicio => Date.today-10,
                       :fin => Date.today+60)

  ##Peticion.get(1).actualizaciones.create(:contenido => texto3,
  ##                                       :fecha => 'Hoy')
  ##Peticion.get(2).actualizaciones.create(:contenido => texto4,
  ##                                       :fecha => 'Hoy')

end

init_datamapper()
DataMapper.auto_migrate!
init_data()