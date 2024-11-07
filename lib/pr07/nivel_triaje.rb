class NivelTriaje
  attr_reader :nivel

  def initialize(nivel)
    @nivel = nivel
  end

  def nivel_prioridad
    case @nivel
      when 1 then "Reanimacion"
      when 2 then "Emergencia"
      when 3 then "Urgente"
      when 4 then "Menos urgente"
      when 5 then "No urgente"
      else "Desconocido"
    end
  end

end
