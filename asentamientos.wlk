import razas.*
import facciones.*

class Asentamiento {
    const tamaño
    var ejercito
    method tamaño() = tamaño
    method agregarMiembro(unMiembro){ejercito.add(unMiembro)}
    method quitarMiembro(unMiembro){ejercito.remove(unMiembro)}
    method potencialOfensivo() = ejercito.potencialOfensivo()
    method serOcupada(unEjercito)
}


class Aldea inherits Asentamiento{
    const maxTropa
    method initialize(){
        if(maxTropa < 10) self.error("la poblacion es menor a 10")
    }
    override method agregarMiembro(unMiembro) {if (ejercito.size() < tamaño) super(unMiembro) }
    override method serOcupada(unEjercito) {
        if(maxTropa < unEjercito.tamaño()){
        ejercito = new Ejercito(integrantes= unEjercito.losMasFuertes())
        unEjercito.quitarLosMasFuertes()}
        else {ejercito = unEjercito}
    }
}

class Ciudad inherits Asentamiento{
    override method potencialOfensivo() = super() + 300
    override method serOcupada(unEjercito) {ejercito = unEjercito}
}