# Clase Hora que representa una hora del día (hora, minuto, segundo).
#
# Esta clase permite representar horas específicas del día y realizar operaciones como calcular
# la diferencia entre dos horas, convertir una hora a cadena, y comparar instancias de la clase Hora.
#
# La clase incluye funcionalidades como la comparación de horas, el cálculo de la diferencia en tiempo
# y la conversión a segundos totales.
class Hora
  include Comparable
  include Enumerable

  # Accesores solo de lectura para hora, minuto y segundo
  # @return [Integer] la hora, minuto o segundo de la hora
  attr_reader :hora, :minuto, :segundo

  # Constructor para inicializar un objeto de la clase Hora.
  #
  # @param hora [Integer] La hora del día (debe estar entre 0 y 23).
  # @param minuto [Integer] Los minutos del día (debe estar entre 0 y 59).
  # @param segundo [Integer] Los segundos del día (debe estar entre 0 y 59).
  # @raise [ArgumentError] Si la hora, los minutos o los segundos están fuera de rango.
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

  # Método para calcular la diferencia en horas, minutos y segundos entre dos objetos Hora.
  #
  # Este método compara la hora actual del objeto con la hora proporcionada en otro objeto `Hora`
  # y devuelve la diferencia en horas, minutos y segundos.
  #
  # @param otra_hora [Hora] Otro objeto de tipo Hora con el que comparar.
  # @return [Hash] La diferencia en horas, minutos y segundos entre las dos horas.
  # @example
  #   hora1 = Hora.new(10, 30, 15)
  #   hora2 = Hora.new(12, 45, 20)
  #   hora1.diferencia_en_tiempo(hora2)
  #   # => { horas: 2, minutos: 15, segundos: 5 }
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

  # Compara dos instancias de la clase Hora.
  #
  # Este método implementa la interfaz de comparación en Ruby. Compara las horas, minutos y segundos
  # en orden, retornando un valor negativo, cero o positivo según la comparación.
  #
  # @param other [Hora] El otro objeto de tipo Hora para comparar.
  # @return [Integer] -1 si la hora actual es menor, 0 si son iguales, 1 si la hora actual es mayor.
  def <=>(other)
    [@hora, @minuto, @segundo] <=> [other.hora, other.minuto, other.segundo]
  end

  # Itera sobre los componentes de la hora (hora, minuto, segundo) y los pasa a un bloque.
  #
  # @yield [hora, minuto, segundo] Cada uno de los componentes de la hora.
  def each
    [@hora, @minuto, @segundo].each { |componente| yield componente }
  end

  # Calcula la diferencia en segundos entre dos horas.
  #
  # Este método calcula la diferencia absoluta en segundos entre la hora actual y otra hora proporcionada.
  #
  # @param otra_hora [Hora] Otra instancia de la clase Hora para comparar.
  # @return [Integer] La diferencia en segundos entre las dos horas.
  def diferencia_segundos(otra_hora)
    (self.total_segundos - otra_hora.total_segundos).abs
  end

  # Calcula el total de segundos desde las 00:00:00.
  #
  # Este método convierte la hora, los minutos y los segundos en un valor total de segundos.
  #
  # @return [Integer] El total de segundos desde las 00:00:00.
  def total_segundos
    @hora * 3600 + @minuto * 60 + @segundo
  end

  # Método para convertir la hora a un string en formato HH:MM:SS.
  #
  # @return [String] La hora representada como una cadena en el formato "HH:MM:SS".
  def to_s
    format("%02d:%02d:%02d", @hora, @minuto, @segundo)
  end
end
