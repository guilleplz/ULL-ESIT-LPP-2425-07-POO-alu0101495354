require_relative 'servicio_salud'

class ServicioUrgencias < ServicioSalud
  attr_accessor :camas_uci_disponibles

  # Constructor
  def initialize(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos, camas_uci_disponibles)
    # Llama al constructor de la clase base
    super(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos)
    # Atributo específico de ServicioUrgencias
    @camas_uci_disponibles = camas_uci_disponibles
  end

  # Método to_s
  def to_s
    super + "Camas UCI disponibles: #{@camas_uci_disponibles}\n"
  end

  
end
