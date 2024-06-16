import mutual.*
import libros.*

class Socio{
	const actividadesRealizadas = []
	var property maximoDeActividadesRealizadas
	var property edad
	const coleccionDeIdiomas = []
	
	method agregarActividad(unaActividad){
		if (actividadesRealizadas.size() < maximoDeActividadesRealizadas){
			actividadesRealizadas.add(unaActividad)
		}
		else self.error("error")
	}
	
	method esAdoradorDelSol(){
		return actividadesRealizadas.all({a => a.sirveParaBroncearse()})
	}
	
	method coleccionDeActividadesEsforzadas(){
		actividadesRealizadas.filter({ a => a.implicaEsfuerzo()})
	}
	
	method actividadRealizada(unaActividad){
		return actividadesRealizadas.contains(unaActividad)
	}
	
	method coleccionDeIdiomas(){
		return coleccionDeIdiomas
	}
	
}

class SocioTranquilo inherits Socio{
	 method leAtrae(unaActividad){
		return unaActividad.diasDeViaje() >= 4
	}
}

class SocioCoherente inherits SocioTranquilo{
	override method leAtrae(unaActividad){
		return if (self.esAdoradorDelSol()){
			unaActividad.sirveParaBroncearse()
		}
		else unaActividad.implicaEsfuerzo()
	}
}

class SocioRelajado inherits SocioTranquilo{
	override method leAtrae(unaActividad){
		return coleccionDeIdiomas.contains(unaActividad.idioma())
	}
}
