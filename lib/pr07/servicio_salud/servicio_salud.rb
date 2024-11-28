class ServicioSalud
  include Comparable
  include Enumerable

  attr_accessor :codigo_identificacion, :descripcion, :horario_apertura, :horario_cierre,
                :calendario_festivos, :medicos, :camas_estandar

  def initialize(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos)
    @codigo_identificacion = codigo_identificacion
    @descripcion = descripcion
    @horario_apertura = horario_apertura
    @horario_cierre = horario_cierre
    @calendario_festivos = calendario_festivos
    @medicos = []
    @camas_estandar = {}
  end

  def asignar_paciente_a_cama(paciente, cama_id)
    raise 'Cama ocupada' if @camas_estandar[cama_id]

    @camas_estandar[cama_id] = paciente
  end

  def to_s
    "#{@codigo_identificacion} - #{@descripcion} - #{@horario_apertura} - #{@horario_cierre} - [#{@calendario_festivos.join(", ")}]"
  end

  def duracion_ocupacion_cama(cama_id, fecha_ingreso, fecha_alta)
    raise 'Cama no ocupada' unless @camas_estandar[cama_id]

    (fecha_alta.diferencia_dias(fecha_ingreso))
  end

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

  def <=>(other)
    @medicos.size <=> other.medicos.size
  end

  def each
    @medicos.each { |medico| yield medico }
  end

end
