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

  def diferencia_en_tiempo(otra_hora)
    hora_diff = otra_hora.hora - @hora
    minuto_diff = otra_hora.minuto - @minuto
    segundo_diff = otra_hora.segundo - @segundo

    if segundo_diff < 0
      segundo_diff += 60
      minuto_diff -= 1
    end

    if minuto_diff < 0
      minuto_diff += 60
      hora_diff -= 1
    end

    {
      horas: hora_diff,
      minutos: minuto_diff,
      segundos: segundo_diff
    }
  end


end
