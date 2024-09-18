object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }

	method esPar() { return self.peso() % 2 == 0 }
}

// Bumblebee

object bumblebee {
	var estadoActual = auto // La inicializamos en auto porque si.

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
}

object arenaAGranel {
	var property peso = 0 // Ver si esta mal por el polimorfismo, yo creo que no porque el getter sera .peso()

	method nivelPeligrosidad() {
		return 1
	}
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
}

