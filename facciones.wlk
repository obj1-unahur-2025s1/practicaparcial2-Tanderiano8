import razas.*
import asentamientos.*

class Ejercito{
    const property integrantes = []
    method agregarMiembro(unMiembro){integrantes.add(unMiembro)}
    method quitarMiembro(unMiembro){integrantes.remove(unMiembro)}
    method potencialOfensivo() = integrantes.sum({i=>i.potencialOfensivo()})
    method tamaño() = integrantes.size()
    method invadir(unAsentamiento) {
        if (self.puedeInvadir(unAsentamiento))unAsentamiento.serOcupada(self)}
    method puedeInvadir(unAsentamiento) = self.potencialOfensivo() > unAsentamiento.potencialOfensivo()
    method losMasFuertes() = self.ordenadosMasPoderosos().take(10)
    method ordenadosMasPoderosos() = integrantes.sortBy({i1, i2 => i1.potencialOfensivo() > i2.potencialOfensivo()})
    method quitarLosMasFuertes() {integrantes.removeAll(self.losMasFuertes())}
}

