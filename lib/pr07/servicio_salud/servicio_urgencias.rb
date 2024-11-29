require_relative 'servicio_salud'

# Clase que representa un servicio de urgencias, derivado de ServicioSalud.
#
# Esta clase extiende la funcionalidad de `ServicioSalud` añadiendo un atributo específico para gestionar
# las camas UCI disponibles en el servicio de urgencias. También implementa métodos para gestionar las camas
# libres, considerando tanto las camas estándar como las camas UCI.
#
# @see ServicioSalud
class ServicioUrgencias < ServicioSalud
  # Atributo que indica el número de camas UCI disponibles en el servicio de urgencias.
  # @return [Integer] Número de camas UCI disponibles.
  attr_accessor :camas_uci_disponibles

  # Inicializa una nueva instancia de ServicioUrgencias.
  #
  # Este constructor extiende el constructor de la clase base `ServicioSalud` para incluir un atributo
  # adicional que es el número de camas UCI disponibles en el servicio de urgencias.
  #
  # @param codigo_identificacion [String] El código único de identificación del servicio.
  # @param descripcion [String] Descripción del servicio de urgencias.
  # @param horario_apertura [String] El horario de apertura del servicio de urgencias.
  # @param horario_cierre [String] El horario de cierre del servicio de urgencias.
  # @param calendario_festivos [Array<String>] Lista de fechas de festivos para el servicio.
  # @param camas_uci_disponibles [Integer] Número de camas UCI disponibles en el servicio de urgencias.
  def initialize(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos, camas_uci_disponibles)
    # Llama al constructor de la clase base
    super(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos)
    # Atributo específico de ServicioUrgencias
    @camas_uci_disponibles = camas_uci_disponibles
  end

  # Devuelve una representación en forma de cadena del servicio de urgencias.
  #
  # Este método sobrescribe el método `to_s` de la clase base para incluir la información adicional
  # sobre las camas UCI disponibles en el servicio de urgencias.
  #
  # @return [String] Descripción del servicio de urgencias, incluyendo las camas UCI disponibles.
  def to_s
    super + "Camas UCI disponibles: #{@camas_uci_disponibles}\n"
  end

  # Calcula el número total de camas libres en el servicio de urgencias.
  #
  # Este método suma el número de camas libres tanto en la unidad de cuidados intensivos (UCI)
  # como en las camas estándar. Las camas estándar se consideran libres si tienen el valor `nil`.
  #
  # @return [Integer] Número total de camas libres en el servicio de urgencias.
  def numero_camas_libres
    @camas_uci_disponibles + @camas_estandar.values.count(nil)
  end
end
