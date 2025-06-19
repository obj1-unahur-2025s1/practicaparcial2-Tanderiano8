
import asentamientos.*
import facciones.*
class Raza{
  var rol
  var inteligencia
  var fuerza
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


class Guerrero inherits Rol{
  override method potenciaExtra() =  100
  override method esGroso(unPersonaje) = unPersonaje.fuerza() > 50 
}
class Cazador inherits Rol{
  var mascota = null
  method tieneMascota() = mascota!= null
  method mascota() = mascota
  method domar(fuerzaMascota,edadMascota,tieneGarrasMascota) {mascota = new Mascota(fuerza= fuerzaMascota, edad = edadMascota, tieneGarras = tieneGarrasMascota)}
  override method potenciaExtra() = if (self.tieneMascota()) mascota.potencialOfensivo() else 0 
  override method esGroso(unPersonaje) = if (self.tieneMascota())  mascota.esLongeva() 
}
class Brujo inherits Rol{
  override method potenciaExtra() =  0
  override method esGroso(unPersonaje) = true
}

class Mascota{
  var fuerza
  var edad
  const tieneGarras
  method potencialOfensivo() = if (tieneGarras) fuerza * 2 else fuerza
  method esLongeva() = edad > 10
}

