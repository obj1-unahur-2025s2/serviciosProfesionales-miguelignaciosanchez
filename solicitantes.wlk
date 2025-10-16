// SOLICITANTES
class Persona {
    const property provincia
    method puedeSerAtendidoPor(profesional) {
        return profesional.puedeTrabajarEn(provincia)
    }
}
class Institucion {
    const property universidadesReconocidas
    method puedeSerAtendidoPor(profesional) {
        return universidadesReconocidas.contains(profesional.universidad())
    }
}
class Club {
    const property provincias
    method puedeSerAtendidoPor(profesional) {
        return provincias.any({ prov => profesional.puedeTrabajarEn(prov) })
    }
}