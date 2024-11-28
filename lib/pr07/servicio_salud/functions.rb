require_relative 'servicio_salud'
require_relative 'servicio_urgencias'

# Fusiona dos servicios de salud y devuelve un nuevo servicio.
#
# @param servicio1 [ServicioSalud] El primer servicio a fusionar.
# @param servicio2 [ServicioSalud] El segundo servicio a fusionar.
# @return [ServicioSalud] Un nuevo servicio que representa la fusión de ambos.
def fusionar_servicios(servicio1, servicio2)
  raise ArgumentError, "Ambos servicios deben ser del mismo tipo" unless servicio1.class == servicio2.class
  raise ArgumentError, "Ambos deben ser servicios" unless servicio1.kind_of?(ServicioSalud) && servicio1.kind_of?(ServicioSalud)

  # Fusión de atributos comunes
  nuevo_codigo = "#{servicio1.codigo_identificacion}-#{servicio2.codigo_identificacion}"
  nueva_descripcion = "#{servicio1.descripcion} & #{servicio2.descripcion}"
  nuevo_horario_apertura = [servicio1.horario_apertura, servicio2.horario_apertura].min
  nuevo_horario_cierre = [servicio1.horario_cierre, servicio2.horario_cierre].max
  nuevo_calendario_festivos = (servicio1.calendario_festivos + servicio2.calendario_festivos).uniq
  nuevos_medicos = (servicio1.medicos + servicio2.medicos).uniq
  nuevas_camas_estandar = servicio1.camas_estandar.merge(servicio2.camas_estandar)

  # Crear el nuevo servicio basado en el tipo específico
  if servicio1.is_a?(ServicioUrgencias)
    nuevas_camas_uci = servicio1.camas_uci_disponibles + servicio2.camas_uci_disponibles
    return ServicioUrgencias.new(
      nuevo_codigo,
      nueva_descripcion,
      nuevo_horario_apertura,
      nuevo_horario_cierre,
      nuevo_calendario_festivos,
      nuevas_camas_uci
    ).tap do |nuevo_servicio|
      nuevo_servicio.medicos = nuevos_medicos
      nuevo_servicio.camas_estandar = nuevas_camas_estandar
    end
  else
    return ServicioSalud.new(
      nuevo_codigo,
      nueva_descripcion,
      nuevo_horario_apertura,
      nuevo_horario_cierre,
      nuevo_calendario_festivos
    ).tap do |nuevo_servicio|
      nuevo_servicio.medicos = nuevos_medicos
      nuevo_servicio.camas_estandar = nuevas_camas_estandar
    end
  end
end
