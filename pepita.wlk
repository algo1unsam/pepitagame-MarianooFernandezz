import example.*
import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0, 0)

	method image() {
		return if (self.estaEnElNido()){
			 "pepita-grande.png"
			 }
			 else if (self.estaCansada()){
				game.say(self, "Tengo tanta hambre que no puedo seguir")
				game.schedule(2000, { game.stop() })
				"pepita-gris.png"
			 } else if (self.esAtrapada()) {
				game.schedule(2000, { game.stop() })
				"pepita-gris.png"
			 }
			 else{
				"pepita.png"
			 }
	}

	method esAtrapada()=self.position()==silvestre.position()

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if (!self.estaCansada() && !self.esAtrapada() && !self.estaEnElNido()) { //puse esta condicion tan larga xq si cumple, el delay permitia que pepita se siga moviendo
			if (nuevaPosicion.x().between(0, game.width() - 1) && nuevaPosicion.y().between(0, game.height() - 1)) { //si esta adentro de los bordes del jueguito.. 
				self.vola(position.distance(nuevaPosicion))
				position = nuevaPosicion
			}
		} 
	}

	method tieneEnergia()= energia>0

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

	method baja(){
		if (!self.estaEnElSuelo() && !self.estaCansada()) {
		position = position.down(1)
		}
	}
}