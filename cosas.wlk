object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1}

	method esPar() { return self.peso() % 2 == 0 }

	method cargada() { // No hace nada
	}
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

	method esPar() { return self.peso() % 2 == 0 }

	method cargada() {
		estadoActual = robot
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

	method bultos() { 
		return if (cantidadLadrillos <= 100) {
		1
		} else if (cantidadLadrillos > 100 and cantidadLadrillos <= 300) {
		2
		} else {
		3
		}
	}

	method esPar() { return self.peso() % 2 == 0 }

	method cargada() {
		cantidadLadrillos = cantidadLadrillos + 12
	}
}

object arenaAGranel {
	var property peso = 0 

	method nivelPeligrosidad() {
		return 1
	}

	method bultos() { return 1}

	method esPar() { return self.peso() % 2 == 0 }

	method cargada() {
		peso = peso + 20
	}
}

object bateriaAntiaerea { // Ver si esta bien
	var estado = cargado

	method peso() {
		return estado.peso()
	}

	method nivelPeligrosidad() {
		return estado.nivelPeligro()
	}

	method estado(_estado) {
		estado = _estado
	}

	method bultos() {
		return estado.bulto()
	}

	method esPar() { return self.peso() % 2 == 0 }

	method cargada() {
		estado = cargado
	}
}

object cargado {
	method peso() {
		return 300
	}

	method nivelPeligro() {
	  return 100
	}

	method bulto() {
		return 2
	}
}

object descargado {
	method peso() {
		return 200
	}

	method nivelPeligro() {
		return 0
	}

	method bulto() {
		return 1
	}
} 

object contenedorPortuario {
	const pesoBase = 100
	const cosas = #{}

	method agregar(cosa) {
		cosas.add(cosa)
	}

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

	method esPar() { return self.peso() % 2 == 0 }

	method cargada() {
		cosas.forEach({cosa => cosa.cargada()})
	}
}

object residuoRadioactivo {
	var property peso = 0 

	method nivelPeligrosidad() {
		return 200
	}

	method bultos() { return 1}

	method esPar() { return self.peso() % 2 == 0 }

	method cargada() {
		peso = peso + 15
	}

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

	method esPar() { return self.peso() % 2 == 0 }

	method cargada() {
		
	}
}