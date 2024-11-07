class Hora
  attr_reader :hora, :minuto, :segundo

  def initialize(hora, minuto, segundo)
    # Validar que la hora esté entre 0 y 23
    raise ArgumentError, "La hora debe estar entre 0 y 23" unless hora.between?(0, 23)

    # Validar que los minutos estén entre 0 y 59
    raise ArgumentError, "Los minutos deben estar entre 0 y 59" unless minuto.between?(0, 59)

    # Validar que los segundos estén entre 0 y 59
    raise ArgumentError, "Los segundos deben estar entre 0 y 59" unless segundo.between?(0, 59)

    @hora = hora
    @minuto = minuto
    @segundo = segundo
  end

end
