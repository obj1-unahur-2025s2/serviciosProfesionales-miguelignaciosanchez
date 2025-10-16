import universidad.*
// PROFESIONALES
class ProfesionalVinculado {
    const property universidad
    method honorariosPorHora() {
        return universidad.honorariosRecomendados
    }
    method provinciasHabilitadas() {
        return #{universidad.provincia}
    }
    method puedeTrabajarEn(provincia) {
        return self.provinciasHabilitadas().contains(provincia)
    }
    method puedeAtender(solicitante) {
        return solicitante.puedeSerAtendidoPor(self)
    }
    method cobrar(monto) {
        const mitad = monto / 2
        universidad.recibirDonacion(mitad)
    }
}
class ProfesionalAsociadoDelLitoral {
    const property universidad
    method honorariosPorHora() {
        return 3000
    }
    method provinciasHabilitadas() {
        return #{"Entre Ríos", "Santa Fe", "Corrientes"}
    }
    method puedeTrabajarEn(provincia) {
        return self.provinciasHabilitadas().contains(provincia)
    }
    method puedeAtender(solicitante) {
        return solicitante.puedeSerAtendidoPor(self)
    }
    method cobrar(monto) {
        asociacionProfesionalesLitoral.recibirDinero(monto)
    }
}
class ProfesionalLibre {
    const property universidad
    const property honorariosPorHora
    const property provinciasHabilitadas
    var property totalRecaudado = 0
    method puedeTrabajarEn(provincia) {
        return provinciasHabilitadas.contains(provincia)
    }
    method puedeAtender(solicitante) {
        return solicitante.puedeSerAtendidoPor(self)
    }
    method cobrar(monto) {
        totalRecaudado += monto
    }
    method pasarDinero(otroProfesional, cantidad) {
        totalRecaudado -= cantidad
        otroProfesional.cobrar(cantidad)
    }
}
