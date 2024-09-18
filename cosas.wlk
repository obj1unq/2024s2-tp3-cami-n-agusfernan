object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1}

	method esPar() { return self.peso() % 2 == 0 }
}

// Bumblebee

object bumblebee {
	var estadoActual = auto // La inicializamos en auto porque si.

	method bultos() { return 2}


	method peso() {
		return 800
	}

	method nivelPeligrosidad() {
		return estadoActual.nivelPeligro()
	}

	method estadoActual(_estado) {
		estadoActual = _estado
	}
}

object auto {
	method nivelPeligro() {
		return 15
	}
}

object robot {
	method nivelPeligro() {
		return 30
	}
}
// Hasta aca Bumblebee

object paqueteDeLadrillos {
	var cantidadLadrillos = 0

	method cantidadLadrillos(cantLadrillos) {
		cantidadLadrillos = cantLadrillos
	}

	method peso() {
		return cantidadLadrillos * 2
	}

	method nivelPeligrosidad() {
		return 2
	}

	method bultos() { // Preguntar como se pdoria solucionar sin anidar IFs
		if (cantidadLadrillos <= 100) {
		return	1
		} else if (cantidadLadrillos > 100 and cantidadLadrillos <= 300) {
			return 2
		} else {
			return 3
		}
	}
}

object arenaAGranel {
	var property peso = 0 // Ver si esta mal por el polimorfismo, yo creo que no porque el getter sera .peso()

	method nivelPeligrosidad() {
		return 1
	}

	method bultos() { return 1}

}

object bateriaAntiaerea { // Ver si esta bien
	var estaConMisiles = false

	method peso() {
		return if (estaConMisiles) 300 else 200
	}

	method nivelPeligrosidad() {
		return if (estaConMisiles) 100 else 0
	}

	method estaConMisiles(estado) {
		estaConMisiles = estado
	}

	method bultos() {
		return if (estaConMisiles) 2 else 1
	}
}

object contenedorPortuario {
	const pesoBase = 100
	const cosas = #{}

	method peso() {
		return pesoBase + cosas.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad() {
		return self.nivelMaximoDePeligrosidad()
	}

	method nivelMaximoDePeligrosidad() {
		return cosas.map({cosa => cosa.nivelPeligrosidad()}).max()
	}

	method bultos() {
		return 1 + cosas.sum({cosa => cosa.bultos()})
	}
}

object residuoRadioactivo {
	var property peso = 0 // Ver si esta mal por el polimorfismo, yo creo que no porque el getter sera .peso()

	method nivelPeligrosidad() {
		return 200
	}

	method bultos() { return 1}

}

object embalajeDeSeguridad {
	var cosa = null

	method bultos() { return 2}

	method cosa(_cosa) {
		cosa = _cosa
	}

	method peso() {
		return cosa.peso()
	}

	method nivelPeligrosidad() {
		return	cosa.nivelPeligrosidad() / 2
	}
}