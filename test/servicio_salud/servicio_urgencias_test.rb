require 'test_helper'

class ServicioUrgenciasTest < Test::Unit::TestCase

  def setup

    @servicio = ServicioUrgencias.new(1, "hospital", Hora.new(8, 0, 0), Hora.new(20, 0, 30), [Fecha.new(2024, 1, 1), Fecha.new(2024, 12, 6)], 10)
    @paciente = Paciente.new(1, "Juan", "García", "Hombre", Fecha.new(1980, 1, 1), 1)
    @medico = Medico.new(1, "Pedro", "López", "Hombre", Fecha.new(1970, 1, 1), "12345678A")
    @servicio.medicos << @medico
    @servicio.asignar_paciente_a_cama(nil, 1)

  end

  def test_servicio_urgencias
    assert_equal 1, @servicio.codigo_identificacion
    assert_equal "hospital", @servicio.descripcion
    assert_equal Hora.new(8, 0, 0), @servicio.horario_apertura
    assert_equal Hora.new(20, 0, 30), @servicio.horario_cierre
    assert_equal [Fecha.new(2024, 1, 1), Fecha.new(2024, 12, 6)], @servicio.calendario_festivos
    assert_equal [@medico], @servicio.medicos
    assert_equal 10, @servicio.camas_uci_disponibles
  end

  def test_numero_camas_libres
    assert_equal 11, @servicio.numero_camas_libres
  end

  def test_polimorfismo
    assert_equal true, @servicio.respond_to?(:asignar_paciente_a_cama)
    assert_equal true, @servicio.respond_to?(:numero_pacientes_asignados)
    assert_equal true, @servicio.respond_to?(:duracion_ocupacion_cama)
  end
end
