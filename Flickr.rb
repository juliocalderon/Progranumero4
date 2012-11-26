#Prueba 1 de flickr
#Gema Flickraw
#Versionde Ruby 1.8

require 'rubygems'
require 'json'
require 'flickraw'


class Flickr

	#Variables globales de la clase
	$Foto 			#Variable para imagen de la foto
	$Titulo			#Variable de texto de la foto
	$Contador = 1 		#Contador para imprimir
	$Albun = []		#Contenedor de todas las fotos
	$Fotografia = []	#Contador de una foto
	$Counter = 0		#Contador para imagenes	
	$Largo			#Largo de $Albun
	$sigima=0

	#Constructor de la clase
	def initialize()
		FlickRaw.api_key =  "b907fe707248d846c970de37fdf212e0"
		FlickRaw.shared_secret = "d6300bd479506d23"
	end
	
	
	#Metodo de obtener las fotos
	#No recive argumentos
	def obtener_fotos(filtro, numero)
		$Fotos = flickr.photos.search(:tags => filtro, :per_page => numero, :page => 1)
	end
	
	def ingresar_info()
		for foto in $Fotos do
			info = flickr.photos.getInfo(:photo_id => foto.id)
			$Fotografia.push(info.title)
			$Fotografia.push(FlickRaw.url_q(info))
			$Albun.push($Fotografia)
			$Fotografia = []
		end
		$Largo = $Albun.length
	end
	
	#Metodo de obtener información
	#No recive argumentos
	def obtener_info()
		for foto in $Albun do
			puts "#" + $Contador.to_s
			$Contador = $Contador + 1
			puts "Titulo de la Imagen: " + foto[0]
			puts "Direccion de la imagen: " + foto[1]
			puts "                           "
		end
	end
	
	def Contador()
		if $sigima < $Tamaño
				$Titulo = $Lista[$sigima][0]
				$Foto = $Lista[$sigima][1]
				$sigima = $sigima + 1
				puts $Foto
		else puts "Final"
		end
	end

	def asigna_imagen()
		if $Counter < $Largo
			$Titulo = $Albun[$Counter][0]
			$Foto	= $Albun[$Counter][1]
			puts $Foto
		else puts "Hemos llegado al final del archivo"
		end
	end
	
end
