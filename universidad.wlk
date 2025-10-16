// UNIVERSIDADES
class Universidad {
    const property nombre
    const property provincia
    const property honorariosRecomendados
    var property donacionesRecibidas = 0
    method recibirDonacion(monto) {
        donacionesRecibidas += monto
    }
    override method toString() {
        return nombre
    }
}
// ASOCIACIÓN DEL LITORAL
object asociacionProfesionalesLitoral {
    var property totalRecaudado = 0
    method recibirDinero(monto) {
        totalRecaudado += monto
    }
    method mostrarTotal() { return totalRecaudado }
}