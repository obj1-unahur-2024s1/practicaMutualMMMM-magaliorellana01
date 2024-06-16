import socios.*
import libros.*

class ViajesDePlaya{
	const property idioma = []
	var property largoDePlaya
	
	method idioma(){
		return idioma 
	}
	
	method largoDePlaya(){
		return largoDePlaya
	}
	
	method diasDeViaje(){
		return largoDePlaya / 500
	}
	
	method implicaEsfuerzo(){
		return largoDePlaya > 1200
	}
	
	method sirveParaBroncearse(){
		return true
	}
	
	method esInteresante(){
		return idioma.size() > 1
	}
	
	method actividadRecomendadaParaSocio(socio){
		return self.esInteresante() and socio.leAtrae(self) and
		not socio.actividadRealizada(self) == self
		
	}
}

class ExcursionALaCiudad{
	const property idioma = []
	var property cantidadDeAtraccionesAVisitar
	
	method idioma(){
		return idioma 
	}
	method diasDeViaje(){
		return cantidadDeAtraccionesAVisitar / 2 
	}
	
	method implicaEsfuerzo(){
		return cantidadDeAtraccionesAVisitar.between(5,8)
	}
	
	method sirveParaBroncearse(){
		return false
	}
	
	method esInteresante(){
		return idioma.size() > 1 or cantidadDeAtraccionesAVisitar == 5
	}
	
	method actividadRecomendadaParaSocio(socio){
		return self.esInteresante() and socio.leAtrae(self) and
		not socio.actividadRealizada(self) == self
	}
	
	
}

class ExcursionesACiudadTropical inherits ExcursionALaCiudad{
	override method diasDeViaje(){
		return
		super() + 1
	}
	
	override method sirveParaBroncearse(){
		return true
	}
}


class SalidaDeTrekking {
	const property idioma = []
	var property kmDeSenderos
	var property diasDeSolPorAnio
	
	method idioma(){
		return idioma 
	}
	
	method diasDeViaje(){
		return kmDeSenderos / 50
	}
	
	method implicaEsfuerzo(){
		return kmDeSenderos > 80
	}
	
	method sirveParaBroncearse(){
		return diasDeSolPorAnio > 200 or diasDeSolPorAnio.between(100,200)
				and kmDeSenderos >= 120
	}
	
	method esInteresante(){
		return idioma.size() > 1 and diasDeSolPorAnio > 140
	}
	
	method actividadRecomendadaParaSocio(socio){
		return self.esInteresante() and socio.leAtrae(self) and
		not socio.actividadRealizada(self) == self
	}
}


class ClasesDeGimnasia{
	const idioma = "espaniol"
	
	method idioma(){
		return idioma 
	}
	
	method diasDeViaje(){
		return 1
	}
	
	method implicaEsfuerzo(){
		return true
	}
	
	method sirveParaBroncearse(){
		return false
	}
	
	method esInteresante(){
		return idioma.size() > 1
	}
	
	method actividadRecomendadaParaSocio(socio){
		return socio.edad().between(20,30)
	}
}

class TallerLiterario{
	const librosQueSeTrabaja = []
	
	method librosQueSeTrabaja(){
		return librosQueSeTrabaja
	}
	
	method idiomasUsados(){
		return librosQueSeTrabaja.map({l => l.idiomaDeLibro()})
	}
	
	method diasDeViaje(){
		return librosQueSeTrabaja.size() + 1
	}
	
	method implicaEsfuerzo(){
		return (librosQueSeTrabaja.any({l => l.cantidadDePaginas() > 500})
				or librosQueSeTrabaja.all({l => l.nombreDeAutor() == l.nombreDeAutor()}))
				and librosQueSeTrabaja.size() > 1
	}
	
	method sirveParaBroncearse(){
		return false
	}
	
	 method actividadRecomendadaParaSocio(socio){
		return socio.coleccionDeIdiomas().size() > 1
	}
}









