# Clase que representa un servicio de salud, que gestiona camas, médicos y pacientes.
#
# La clase `ServicioSalud` permite gestionar la información relacionada con un servicio de salud
# en cuanto a camas ocupadas, médicos asignados, pacientes y horarios de apertura y cierre.
# Incluye métodos para asignar médicos a camas, asignar pacientes a camas, calcular la duración
# de ocupación de camas y otros métodos relacionados con la gestión del servicio.
#
# @see Medico
class ServicioSalud
  include Comparable
  include Enumerable

  # Atributos de la clase
  # @return [String] Código de identificación del servicio
  # @return [String] Descripción del servicio
  # @return [String] Horario de apertura del servicio
  # @return [String] Horario de cierre del servicio
  # @return [Array<String>] Calendario de festivos del servicio
  # @return [Array<Medico>] Lista de médicos del servicio
  # @return [Hash<Integer, Paciente>] Mapa de camas ocupadas por pacientes, con identificador de cama como clave
  attr_accessor :codigo_identificacion, :descripcion, :horario_apertura, :horario_cierre,
                :calendario_festivos, :medicos, :camas_estandar

  # Inicializa una nueva instancia de ServicioSalud.
  #
  # @param codigo_identificacion [String] El código único de identificación del servicio.
  # @param descripcion [String] Descripción del servicio de salud.
  # @param horario_apertura [String] El horario de apertura del servicio.
  # @param horario_cierre [String] El horario de cierre del servicio.
  # @param calendario_festivos [Array<String>] Lista de fechas de festivos para el servicio.
  def initialize(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos)
    @codigo_identificacion = codigo_identificacion
    @descripcion = descripcion
    @horario_apertura = horario_apertura
    @horario_cierre = horario_cierre
    @calendario_festivos = calendario_festivos
    @medicos = []
    @camas_estandar = {}
  end

  # Asigna un médico a un paciente que ocupa una cama.
  #
  # Este método asigna a un médico a un paciente ya asignado a una cama, utilizando el identificador
  # de la cama y el objeto `Medico`. Si la cama no está ocupada, se lanza un error.
  #
  # @param id_cama [Integer] Identificador de la cama ocupada.
  # @param medico [Medico] Médico a asignar al paciente en la cama.
  # @return [String] Mensaje de confirmación o error.
  # @raise [RuntimeError] Si la cama no está ocupada.
  def asignar_medico_a_paciente(id_cama, medico)
    paciente = @camas_estandar[id_cama]
    if paciente.nil?
      raise 'Cama no ocupada'
    else
      medico.agregar_paciente(paciente)
    end
  end

  # Calcula el número total de pacientes asignados a los médicos del servicio.
  #
  # Este método suma el número de pacientes asignados a todos los médicos que forman parte del
  # servicio de salud.
  #
  # @return [Integer] Número total de pacientes asignados a médicos en el servicio.
  def numero_pacientes_asignados
    @medicos.sum { |medico| medico.numero_pacientes }
  end

  # Asigna un paciente a una cama en el servicio de salud.
  #
  # Este método asigna a un paciente a una cama específica. Si la cama ya está ocupada, se lanza
  # un error indicando que la cama está ocupada.
  #
  # @param paciente [Paciente] El paciente a asignar.
  # @param cama_id [Integer] El identificador de la cama a la que se asigna el paciente.
  # @return [String] Mensaje de confirmación.
  # @raise [RuntimeError] Si la cama ya está ocupada.
  def asignar_paciente_a_cama(paciente, cama_id)
    raise 'Cama ocupada' if @camas_estandar[cama_id]

    @camas_estandar[cama_id] = paciente
  end

  # Devuelve una representación en forma de cadena del servicio de salud.
  #
  # @return [String] Descripción del servicio de salud en formato legible.
  def to_s
    "#{@codigo_identificacion} - #{@descripcion} - #{@horario_apertura} - #{@horario_cierre} - [#{@calendario_festivos.join(", ")}]"
  end

  # Calcula la duración de la ocupación de una cama en el servicio de salud.
  #
  # Este método calcula el número de días que un paciente ha ocupado una cama, basado en las
  # fechas de ingreso y alta proporcionadas.
  #
  # @param cama_id [Integer] El identificador de la cama ocupada.
  # @param fecha_ingreso [Date] La fecha de ingreso del paciente.
  # @param fecha_alta [Date] La fecha de alta del paciente.
  # @return [Integer] El número de días que el paciente ha ocupado la cama.
  # @raise [RuntimeError] Si la cama no está ocupada.
  def duracion_ocupacion_cama(cama_id, fecha_ingreso, fecha_alta)
    raise 'Cama no ocupada' unless @camas_estandar[cama_id]

    (fecha_alta.diferencia_dias(fecha_ingreso))
  end

  # Compara dos objetos de tipo ServicioSalud.
  #
  # Este método compara dos instancias de `ServicioSalud` en base al número de médicos asociados,
  # devolviendo un valor negativo si el servicio actual tiene menos médicos, un valor positivo si tiene
  # más médicos, y 0 si tienen la misma cantidad.
  #
  # @param other [Object] El otro objeto a comparar.
  # @return [Integer] Resultado de la comparación (-1, 0, 1).
  def ==(other)
    return nil unless other.is_a?(ServicioSalud)
    self.codigo_identificacion == other.codigo_identificacion &&
    self.descripcion == other.descripcion &&
    self.horario_apertura == other.horario_apertura &&
    self.horario_cierre == other.horario_cierre &&
    self.calendario_festivos == other.calendario_festivos &&
    self.medicos == other.medicos &&
    self.camas_estandar == other.camas_estandar
  end

  # Compara dos objetos de tipo ServicioSalud por el número de médicos.
  #
  # Este método se utiliza para ordenar los servicios según el número de médicos asociados.
  #
  # @param other [Object] El otro objeto a comparar.
  # @return [Integer] Resultado de la comparación entre el número de médicos de ambos servicios.
  def <=>(other)
    @medicos.size <=> other.medicos.size
  end

  # Itera sobre la lista de médicos en el servicio de salud.
  #
  # Este método permite recorrer la lista de médicos utilizando un bloque.
  #
  # @yield [Medico] Cada médico en el servicio de salud.
  def each
    @medicos.each { |medico| yield medico }
  end
end
