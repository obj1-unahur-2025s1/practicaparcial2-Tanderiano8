
import asentamientos.*
import facciones.*
class Raza{
  var rol
  const inteligencia
  const fuerza
  method fuerza() = fuerza
  method cambiarRol(unRol) {rol = unRol}
  method esInteligente()
  method esGroso()= self.esInteligente() or rol.esGroso(self)
  method potencialOfensivo() = fuerza * 10 + rol.potenciaExtra()
}


class Orco inherits Raza{
  override method esInteligente() = false
  override method potencialOfensivo() = super()*1.1
}

class Humano inherits Raza{
  override method esInteligente() = inteligencia > 50
}

class Rol {
  method potenciaExtra()
  method esGroso(unPersonaje)
}


object guerrero inherits Rol{
  override method potenciaExtra() =  100
  override method esGroso(unPersonaje) = unPersonaje.fuerza() > 50 
}
class Cazador inherits Rol{
  var mascota  
  method mascota() = mascota
  method domar(fuerzaMascota,edadMascota,tieneGarrasMascota) {mascota = new Mascota(fuerza= fuerzaMascota, edad = edadMascota, tieneGarras = tieneGarrasMascota)}
  override method potenciaExtra() = mascota.potencialOfensivo()
  override method esGroso(unPersonaje) =mascota.esLongeva() 
}
object brujo inherits Rol{
  override method potenciaExtra() =  0
  override method esGroso(unPersonaje) = true
}

class Mascota{
  const fuerza
  var edad
  const tieneGarras
  method cumplirAños() {edad += 1}
  method potencialOfensivo() = if (tieneGarras) fuerza * 2 else fuerza
  method esLongeva() = edad > 10
}

object noTieneMascota{
  method potencialOfensivo() = 0
  method esLongeva() = false
}