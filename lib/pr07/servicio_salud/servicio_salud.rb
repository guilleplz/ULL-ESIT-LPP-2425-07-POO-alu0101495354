class ServicioSalud
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

  def to_s
    "#{@codigo_identificacion} - #{@descripcion} - #{@horario_apertura} - #{@horario_cierre} - [#{@calendario_festivos.join(", ")}]"
  end

end
