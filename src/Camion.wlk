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
	method pesoTotal() = cargas.sum({carga => carga.peso()}) + 1000 // sin probar por ahora

	method excedidoDePeso() = self.pesoTotal() > 2500
}

object knightRider{
	method peso() = 500
	method peligrosidad() = 10
}
object bumblebee{
	var property esAuto = true
	method peso() = 800
	method peligrosidad() = if(esAuto) 15 else 30	
}

object deposito{
	var property cosas = []
	
	method cargarCamion(camion){
		cosas.foreach({ cosa => camion.cargar(cosas)})
	}
}

// numero.even() es para

