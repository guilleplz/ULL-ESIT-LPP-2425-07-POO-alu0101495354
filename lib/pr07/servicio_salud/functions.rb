require_relative 'servicio_salud'
require_relative 'servicio_urgencias'
require_relative '../constants'

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
  nuevas_camas_estandar = servicio1.camas_estandar.merge(servicio2.camas_estandar) do |cama_id, cama1, cama2|
    # Resolver conflictos: preferir la cama ocupada, o combinar datos según necesidad
    cama1[:paciente] ? cama1 : cama2
  end

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
      nuevas_camas_estandar.size,
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


# Calcula el índice de capacidad de respuesta de un servicio de salud.
#
# Esta función calcula el índice de capacidad de respuesta de un servicio de salud
# basado en el tiempo de ocupación promedio de las camas y el ratio de facultativos por paciente.
# El índice de capacidad de respuesta se clasifica en tres niveles: ACEPTABLE, BUENO y EXCELENTE.
#
# @param servicio [ServicioSalud] El servicio de salud para el que se calculará el índice de capacidad de respuesta.
# @return [Integer] El índice de capacidad de respuesta del servicio.
def calcular_indice_respuesta(servicio)
  # Verifica que haya camas y médicos para evitar divisiones por cero
  return nil if servicio.camas_estandar.empty? || servicio.medicos.empty?

  camas = servicio.camas_estandar.select { |_, cama| !cama[:paciente].nil? }

  # Calcula el tiempo de ocupación promedio (solo para camas ocupadas)
  tiempos_ocupacion = camas.values.map do |cama|
    dias = cama[:fecha_alta].diferencia_dias(cama[:fecha_ingreso])
    dias * 24 * 60 + cama[:hora_alta].diferencia_minutos(cama[:hora_ingreso])
  end.compact

  tiempo_ocupacion_promedio = tiempos_ocupacion.sum / tiempos_ocupacion.size.to_f

  # Calcula el ratio de facultativos por paciente
  pacientes_totales = camas.values.count { |cama| cama[:paciente] }
  ratio_facultativos = pacientes_totales.zero? ? Float::INFINITY : servicio.medicos.length.to_f / pacientes_totales

  # Determina el índice de capacidad de respuesta
  if tiempo_ocupacion_promedio >= 30.0 && ratio_facultativos >= 1.0 / 3.0
    ACEPTABLE
  elsif tiempo_ocupacion_promedio <= 15.0 && ratio_facultativos >= 1.0 / 1.0
    EXCELENTE
  else
    BUENO
  end
end


# Permite seleccionar el servicio con mejor índice de capacidad de respuesta.
#
# @param servicios [Array<ServicioSalud>] Un arreglo de servicios de salud.
# @return [ServicioSalud] El servicio con el mejor índice de capacidad de respuesta.
def seleccionar_servicio_con_mejor_indice(servicios)
  # Calcula el índice de capacidad de respuesta para cada servicio
  servicios.max_by { |servicio| [servicio, calcular_indice_respuesta(servicio)] }

  # Selecciona el servicio con el mayor índice de capacidad de respuesta
  #indices.max_by { |servicio, indice| servicio, indice }.first
end

# Permite seleccionar el servicio con mejor índice de capacidad de respuesta.
#
# @param servicios [Array<ServicioUrgencias>] Un arreglo de servicios de urgencias.
# @return [ServicioUrgencias] El servicio con el mejor índice de capacidad de respuesta.
def seleccionar_servicio_con_mejor_indice_uci(servicios)
  # Filtra los servicios que tengan camas UCI
  servicios_con_uci = servicios.select { |servicio| servicio.camas_uci_disponibles.positive? }
  # Calcula el índice de capacidad de respuesta para cada servicio con camas UCI
  indices = servicios_con_uci.map { |servicio| [servicio, calcular_indice_respuesta(servicio)] }
  # Selecciona el servicio con el mayor índice de capacidad de respuesta
  indices.max_by { |servicio, indice| indice }.first
end

# Calcula el porcentaje de camas libres en cada servicio de urgencias.
#
# @param servicios [Array<ServicioUrgencias>] Un arreglo de servicios de urgencias.
# @return [Float>>] Un array con el porcentaje de camas libres de cada servicio en orden.
def calcular_porcentaje_camas_libres(servicios)
  servicios.map do |servicio|
    camas_ocupadas = servicio.camas_estandar.values.count { |cama| cama[:paciente] }
    camas_totales = servicio.camas_estandar.size
    porcentaje_camas_libres = 100 * (camas_totales - camas_ocupadas) / camas_totales.to_f
    porcentaje_camas_libres
  end
end

# Calcula el porcentaje de facultativos de cada especialidad en cada servicio
#
# @param servicios [Array<ServicioUrgencias>] Un arreglo de servicios.
# @return [Float>>] Un array con el porcentaje de cada servicio en orden.
def calcular_porcentaje_facultativos(servicios)
  servicios.map do |servicio|
    medicos_por_especialidad = servicio.medicos.group_by(&:especialidad)
    total_medicos = servicio.medicos.size
    porcentajes = medicos_por_especialidad.transform_values { |medicos| 100 * medicos.size / total_medicos.to_f }
    porcentajes.map { |especialidad, porcentaje| [especialidad, porcentaje] }
  end
end
