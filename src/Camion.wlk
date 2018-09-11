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