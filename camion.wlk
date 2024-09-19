import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000

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


