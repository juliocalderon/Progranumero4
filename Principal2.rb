require 'rubygems'
require 'erb'
require 'sinatra';
require 'Flickr';



$descrip	#Variable que tiene el paramtro de busqueda
$numero		
$Flickr = Flickr.new()
$Twittear = tweet.new()

get '/' do
	erb :pruebainterfaz2
end

post '/busqueda' do
	$descrip	= params[:campo1].to_s
	$numero		= params[:campo2].to_i
	$Flickr.obtener_fotos($descrip, $numero)
	$Flickr.ingresar_info()
	$Flickr.obtener_info()
	$Flickr.asigna_imagen()
	redirect  '/resultado'
end

	
get '/resultado' do
	erb :resultado
end

post '/siguiente' do
	$Flickr.Contador()
	redirect '/resultado'
end
