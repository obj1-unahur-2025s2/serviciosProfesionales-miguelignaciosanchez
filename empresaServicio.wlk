import profesionales.*

// EMPRESA DE SERVICIOS
class EmpresaDeServicios {
    const property profesionales = #{}
    const property honorarioDeReferencia
    const property clientes = #{}
    method contratar(profesional) {
        profesionales.add(profesional)
    }
    method cantidadProfesionalesEstudiaronEn(universidad) {
        return profesionales.count({ prof => prof.universidad == universidad })
    }
    method profesionalesCaros() {
        return profesionales.filter({ prof => 
            prof.honorariosPorHora() > honorarioDeReferencia
        })
    }
    method universidadesFormadoras() {
        return profesionales.map({ prof => prof.universidad }).asSet()
    }
    method profesionalMasBarato() {
        return profesionales.min({ prof => prof.honorariosPorHora() })
    }
    method esDeGenteAcotada() {
        return profesionales.all({ prof => 
            prof.provinciasHabilitadas().size() <= 3
        })
    }
    method puedeSatisfacer(solicitante) {
        return profesionales.any({ prof => prof.puedeAtender(solicitante) })
    }
    method darServicio(solicitante) {
        if (self.puedeSatisfacer(solicitante)) {
            const profesional = self.profesionalQueAtiende(solicitante)
            profesional.cobrar(profesional.honorariosPorHora())
            clientes.add(solicitante)
        } else {
            self.error("No se puede satisfacer al solicitante")
        }
    }
    method profesionalQueAtiende(solicitante) {
        return profesionales.findOrDefault(
            { prof => prof.puedeAtender(solicitante) },
            { self.error("No hay profesional disponible") }
        )
    }
    method cantidadClientes() {
        return clientes.size()
    }
    method tieneComoCliente(solicitante) {
        return clientes.contains(solicitante)
    }
    method esPocoAtractivo(profesional) {
        return profesional.provinciasHabilitadas().all({ provincia =>
            self.tieneOtroProfesionalMasBaratoEn(provincia, profesional)
        })
    }
    method tieneOtroProfesionalMasBaratoEn(provincia, profesionalOriginal) {
        return profesionales.any({ prof =>
            prof != profesionalOriginal &&
            prof.puedeTrabajarEn(provincia) &&
            prof.honorariosPorHora() < profesionalOriginal.honorariosPorHora()
        })
    }
}
