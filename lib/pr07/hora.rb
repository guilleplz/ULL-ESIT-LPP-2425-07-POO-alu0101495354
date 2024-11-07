# Clase Hora que representa una hora del dia (hora, minuto, segundo)
class Hora
  # Accesores solo de lectura para hora, minuto y segundo
  attr_reader :hora, :minuto, :segundo

  # Constructor para inicializar un objeto de la clase Hora
  def initialize(hora, minuto, segundo)
    # Validar que la hora esté entre 0 y 23
    raise ArgumentError, "La hora debe estar entre 0 y 23" unless hora.between?(0, 23)

    # Validar que los minutos estén entre 0 y 59
    raise ArgumentError, "Los minutos deben estar entre 0 y 59" unless minuto.between?(0, 59)

    # Validar que los segundos estén entre 0 y 59
    raise ArgumentError, "Los segundos deben estar entre 0 y 59" unless segundo.between?(0, 59)

    # Asignar los valores de hora, minuto y segundo si son válidos
    @hora = hora
    @minuto = minuto
    @segundo = segundo
  end

  # Método para calcular la diferencia en horas, minutos y segundos entre dos objetos Hora
  def diferencia_en_tiempo(otra_hora)
    # Calcular la diferencia en horas, minutos y segundos
    hora_diff = otra_hora.hora - @hora
    minuto_diff = otra_hora.minuto - @minuto
    segundo_diff = otra_hora.segundo - @segundo

    # Ajustar la diferencia de segundos si es negativa (prestando 1 minuto)
    if segundo_diff < 0
      segundo_diff += 60
      minuto_diff -= 1
    end

    # Ajustar la diferencia de minutos si es negativa (prestando 1 hora)
    if minuto_diff < 0
      minuto_diff += 60
      hora_diff -= 1
    end

    # Retornar la diferencia en horas, minutos y segundos como un hash
    {
      horas: hora_diff,
      minutos: minuto_diff,
      segundos: segundo_diff
    }
  end
end
