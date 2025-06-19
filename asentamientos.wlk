import razas.*
import facciones.*

class Asentamiento {
    const tamaño
    const habitantes = #{}
    method tamaño() = tamaño
    method agregarHabitante(unHabitante) {habitantes.add(unHabitante)}
    method quitarHabitante(unHabitante) {habitantes.remove(unHabitante)}
    method potencialOfensivo() = habitantes.sum({i=>i.potencialOfensivo()})
    method desalojar() {habitantes.clear()}
    method alojar(unEjercito) {if(unEjercito.tamaño() > tamaño )
    habitantes.addAll(unEjercito.losMasFuertes().take(tamaño.min(10)))}
}


class Aldea inherits Asentamiento{
    method cantidadMaximaHabitantes() = tamaño
    override method agregarHabitante(unHabitante) {if (habitantes.size() < tamaño) super(unHabitante) }
}

class Ciudad inherits Asentamiento{

}