import razas.*
import asentamientos.*

class EjercitoInvasor{
    const property integrantes = []
    method agregarMiembro(unMiembro){integrantes.add(unMiembro)}
    method quitarMiembro(unMiembro){integrantes.remove(unMiembro)}
    method potencialOfensivo() = integrantes.sum({i=>i.potencialOfensivo()})
    method tamaño() = integrantes.size()
    method invadir(unAsentamiento) {
        if (self.potencialOfensivo() > unAsentamiento.potencialOfensivo())
         unAsentamiento.desalojar() 
         unAsentamiento.alojar(self) 
    }
    method elMenosFuerte() = integrantes.min({i=>i.potencialOfensivo()})
    method elMasFuerte() = integrantes.max({i=>i.potencialOfensivo()})
    method losMasFuertes() = integrantes.sortBy(self.elMenosFuerte() < {i=>i.potencialOfensivo()})
}

