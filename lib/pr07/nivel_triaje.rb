require_relative './constants'  # Carga las constantes desde otro archivo

# Clase NivelTriaje representa un nivel en el sistema de triaje
# del Sistema Español de Triaje (SET).
class NivelTriaje
  # Nivel de triaje en forma de número (1 a 5)
  # @return [Integer] el nivel de triaje
  attr_reader :nivel

  # Inicializa un nuevo objeto de NivelTriaje
  #
  # @param nivel [Integer] El nivel de triaje (1: Reanimación, 2: Emergencia, etc.)
  def initialize(nivel)
    @nivel = nivel
  end

  # Devuelve el nombre de la prioridad del nivel de triaje.
  #
  # @return [String] La categoría del nivel, como "Reanimación" o "Emergencia".
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
end
