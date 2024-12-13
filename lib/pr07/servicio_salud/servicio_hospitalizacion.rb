require_relative 'servicio_salud'

# Clase que representa un servicio de hospitalización, derivado de ServicioSalud.
#
# Esta clase extiende de `ServicioSalud` y añade funcionalidad específica para los servicios
# de hospitalización, incluyendo el número de plantas disponibles y un método para calcular
# las camas libres en el servicio de hospitalización.
#
# @see ServicioSalud
class ServicioHospitalizacion < ServicioSalud
  # Atributo que indica el número de plantas en el servicio de hospitalización.
  # @return [Integer] El número de plantas del hospital.
  attr_accessor :numero_plantas

  # Inicializa una nueva instancia de ServicioHospitalizacion.
  #
  # @param codigo_identificacion [String] El código único de identificación del servicio.
  # @param descripcion [String] Descripción del servicio de hospitalización.
  # @param horario_apertura [String] El horario de apertura del servicio.
  # @param horario_cierre [String] El horario de cierre del servicio.
  # @param calendario_festivos [Array<String>] Lista de fechas de festivos para el servicio.
  # @param numero_plantas [Integer] El número de plantas del servicio de hospitalización.
  def initialize(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos, numero_camas, numero_plantas)
    super(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos, numero_camas)
    @numero_plantas = numero_plantas
  end

  # Devuelve el número de camas libres en el servicio de hospitalización.
  #
  # Este método cuenta cuántas camas estándar están disponibles (es decir, aquellas que tienen valor `nil`).
  #
  # @return [Integer] El número de camas libres en el servicio.
  def numero_camas_libres
    @camas_estandar.count { |_, detalles| detalles.nil? || detalles[:paciente].nil? }
  end
end
