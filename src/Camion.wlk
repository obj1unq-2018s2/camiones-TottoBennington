object camion{
	var cargas = []
	method cargar(cosa){
		cargas.add(cosa)
	}
	method descargar(cosa){
		cargas.remove(cosa)
	}
	method objetosPeligrosos(n) = cargas.filter({
		carga => carga.peligrosidad()>n
	})
	method objetosMasPeligrososQue(cosa) = cargas.filter({
		carga => carga.peligrosidad()>cosa.peligrosidad()
	})
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = cargas.all({
		carga => carga.peligrosidad()<=nivelMaximoPeligrosidad
	})
	//not cargas.any(carga => carga.epligrosidad()>nMax)
	method pesoTotal() = cargas.sum({carga => carga.peso()}) + 1000 

	method excedidoDePeso() = self.pesoTotal() > 2500
}

object knightRider{
	method peso() = 500
	method peligrosidad() = 10
}
object bumblebee{
	var property modo = modoAuto
	method peso() = 800
	method peligrosidad() = modo.peligrosidad()
}

object modoAuto {
	
	method peligrosidad() = 15
	
}

object modoRobot {
	
	method peligrosidad() = 30
	
}
object paqueteLadrillo{
	var property ladrillos = 0
	method peso() = ladrillos * 2
	method peligrosidad() = 2
}
object arenaAGranel{
	var property peso = 0
	const property peligrosidad = 1
}
object bateriaAntiAerea{
	var property misiles = tieneMisiles
	var property peso = misiles.peso()
	var property peligrosidad = misiles.peligrosidad()
}
object tieneMisiles{
	const property peso = 300
	const property peligrosidad = 100
}
object noTieneMisiles{
	const property peso = 200
	const property peligrosidad = 0
}
object contenerdorPortuario{
	var contenidos = []
	var property peso = 100 + contenidos.sum({cont=>cont.peso()})
	method peligrosidad() = if(contenidos.isEmpty()) 0 else contenidos.max({cont => cont.peligrosidad()}).peligrosidad()
	method agregarContenido(cont){contenidos.add(cont)}
}
object residuosRadioactivos{
	var property peso = 0
	const property peligrosidad = 200
}
object embalajeDeSeguridad{
	var contenido
	method contenido(cosa){
		contenido = cosa
	}
	method peso() = contenido.peso()
	method peligrosidad() = contenido.peligrosidad()/2
}
object deposito{
	var property cosas = []
	
	method cargarCamion(camion){
		cosas.foreach({ cosa => camion.cargar(cosas)})
	}
}

// numero.even() es par
// numero.odd() impar

/*
 * Marcar todo ctrl + shift c -> para comentar y descomentar una x cant de lineas
 * ctrl + barra -> autocompletado de cosas que fueron asignadas a variables
 */