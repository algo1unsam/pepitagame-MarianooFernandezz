import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "Gané loco")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {

	method image() = "silvestre.png"

	method restriccion() = pepita.position().x().max(3)

	method position() = game.at(self.restriccion(), 0)

		method teEncontro(ave) {
		game.say(ave, "Uy me atrapó Silvestre, F")
	}
	
}
