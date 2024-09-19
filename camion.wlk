import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000

	method transportar(destino, camino) {
		self.validarSiEstaExcedidoDePeso()
		self.validarSiPuedeTransportarPorCamino(camino)
		self.validarSiPuedeDescargarEnDestino(destino)
		cosas.union(destino.cosas())
		cosas.clear()
	}

	method validarSiEstaExcedidoDePeso() {
		return if (self.excedidoDePeso()) {
			self.error("No se puede transportar, ¡el camion esta excedido de peso!")
		}
	}

	method validarSiPuedeTransportarPorCamino(camino) {
		return if (not camino.soporta(self)) {
			self.error("El camion no puede viajar por el camino asignado")
		}
	}

	method validarSiPuedeDescargarEnDestino(destino) {
		return if (cosas.totalBultos() + destino.totalBultos() > destino.bultosMaximos()) {
			self.error ("El camion no puede descargar en el destino asignado, ya que supera los bultos maximos permitidos")
		}
	}

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(cosa) {
		cosas.remove(cosa)
	}

	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso().esPar()})
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => (cosa.peso() == peso)})
	}

	method elDelNivel(nivel) {
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method pesoTotal() {
		return tara + self.pesoCarga()
	}

	method pesoCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) { // Ver si esta bien
		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and self.objetosNoSuperanNivel(nivelMaximoPeligrosidad)
	}

	method objetosNoSuperanNivel(nivel) {
		return cosas.all({cosa => cosa.nivelPeligrosidad() < nivel})
	}

	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({cosa => cosa.peso().between(min, max)}) 
	}

	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
		return cosas.map({cosa => cosa.peso()}).asList()
	}

	method totalBultos() {
		return cosas.sum({cosa => cosa.bultos()})
	}
}

// Destino
object almacen {
	const property cosas = #{}
	const property bultosMaximos = 3

	method totalBultos() {
		return cosas.sum({cosa => cosa.bultos()})
	}
}

// Caminos

object ruta9 {
	const property nivelPeligrosidadMaximo = 11 

	method soporta(camion) {
		return camion.puedeCircularEnRuta(nivelPeligrosidadMaximo) // Dudas porque aca revisa si no esta excedido de peso tmb.
	}
}

object caminoVecinal {
	var property pesoTolerado = 0 // Inicializo en 0, al testear se settea.

	method soporta(camion) {
		return pesoTolerado > camion.pesoTotal()
	}
}