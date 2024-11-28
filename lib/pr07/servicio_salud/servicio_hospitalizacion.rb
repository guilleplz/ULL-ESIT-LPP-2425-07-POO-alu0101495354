require_relative 'servicio_salud'

class ServicioHospitalizacion < ServicioSalud
  attr_accessor :numero_plantas

  def initialize(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos, numero_plantas)
    super(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos)
    @numero_plantas = numero_plantas
  end

  def numero_camas_libres
    @camas_estandar.values.count(nil)
  end
end
