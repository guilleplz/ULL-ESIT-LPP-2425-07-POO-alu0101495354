require_relative './constants'  # Carga las constantes desde otro archivo

# Clase NivelTriaje representa un nivel en el sistema de triaje
# del Sistema Español de Triaje (SET).
#
# Esta clase permite definir un nivel de triaje que representa la prioridad de atención médica
# según los criterios del SET, donde el nivel 1 es el más urgente (Reanimación) y el nivel 5 es el menos urgente.
class NivelTriaje
  include Comparable
  include Enumerable
  # Nivel de triaje en forma de número (1 a 5)
  # @return [Integer] el nivel de triaje, que puede ser un número entre 1 y 5
  attr_reader :nivel

  # Inicializa un nuevo objeto de NivelTriaje
  #
  # @param nivel [Integer] El nivel de triaje (1: Reanimación, 2: Emergencia, etc.)
  # @raise [ArgumentError] Si el nivel no está entre 1 y 5
  def initialize(nivel)
    @nivel = nivel
  end

  # Devuelve el nombre de la prioridad del nivel de triaje.
  #
  # Este método convierte el número de nivel en un nombre descriptivo que corresponde
  # a una prioridad de atención médica. Los niveles van desde Reanimación hasta No urgente.
  #
  # @return [String] La categoría del nivel de triaje, como "Reanimación", "Emergencia", etc.
  # @example
  #   nivel = NivelTriaje.new(1)
  #   nivel.nivel_prioridad
  #   # => "Reanimación"
  def nivel_prioridad
    # Se utiliza un case para determinar el nombre de la prioridad en función del nivel
    case @nivel
    when 1 then REANIMACION        # Nivel 1: Reanimación
    when 2 then EMERGENCIA         # Nivel 2: Emergencia
    when 3 then URGENTE           # Nivel 3: Urgente
    when 4 then MENOS_URGENTE     # Nivel 4: Menos urgente
    when 5 then NO_URGENTE        # Nivel 5: No urgente
    else DESCONOCIDO              # En caso de que el nivel no sea válido, devuelve "Desconocido"
    end
  end

  def <=>(other)
    @nivel <=> other.nivel
  end

  def each
    yield @nivel
  end


end
