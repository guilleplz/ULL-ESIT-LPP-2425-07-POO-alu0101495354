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
    case @nivel
    when 1 then "Reanimación"
    when 2 then "Emergencia"
    when 3 then "Urgente"
    when 4 then "Menos urgente"
    when 5 then "No urgente"
    else "Desconocido"
    end
  end
end
