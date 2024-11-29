require_relative 'servicio_salud'
require_relative 'servicio_urgencias'

# Fusiona dos servicios de salud y devuelve un nuevo servicio combinado.
#
# Esta función toma dos servicios del mismo tipo y los fusiona en un nuevo servicio.
# Los atributos como el código de identificación, descripción, horarios de apertura y cierre,
# calendario de festivos, médicos y camas estándar son combinados. Si los servicios son de tipo
# "ServicioUrgencias", también se combinan las camas UCI disponibles.
#
# @param servicio1 [ServicioSalud] El primer servicio a fusionar.
# @param servicio2 [ServicioSalud] El segundo servicio a fusionar.
# @return [ServicioSalud] Un nuevo servicio que representa la fusión de ambos servicios de entrada.
# @raise [ArgumentError] Si los dos servicios no son del mismo tipo.
# @raise [ArgumentError] Si alguno de los servicios no es una instancia de ServicioSalud o ServicioUrgencias.
def fusionar_servicios(servicio1, servicio2)
  # Verifica que los servicios sean del mismo tipo
  raise ArgumentError, "Ambos servicios deben ser del mismo tipo" unless servicio1.class == servicio2.class
  # Verifica que ambos servicios sean instancias de ServicioSalud o derivados
  raise ArgumentError, "Ambos deben ser servicios" unless servicio1.kind_of?(ServicioSalud) && servicio1.kind_of?(ServicioSalud)

  # Fusiona los atributos comunes entre los dos servicios.
  nuevo_codigo = "#{servicio1.codigo_identificacion}-#{servicio2.codigo_identificacion}"
  nueva_descripcion = "#{servicio1.descripcion} & #{servicio2.descripcion}"
  nuevo_horario_apertura = [servicio1.horario_apertura, servicio2.horario_apertura].min
  nuevo_horario_cierre = [servicio1.horario_cierre, servicio2.horario_cierre].max
  nuevo_calendario_festivos = (servicio1.calendario_festivos + servicio2.calendario_festivos).uniq
  nuevos_medicos = (servicio1.medicos + servicio2.medicos).uniq
  nuevas_camas_estandar = servicio1.camas_estandar.merge(servicio2.camas_estandar)

  # Crea el nuevo servicio basado en el tipo específico de los servicios
  if servicio1.is_a?(ServicioUrgencias)
    # Si los servicios son de tipo ServicioUrgencias, fusiona también las camas UCI
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
    # Si los servicios no son de tipo ServicioUrgencias, crea un nuevo ServicioSalud
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
