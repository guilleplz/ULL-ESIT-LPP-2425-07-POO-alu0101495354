require 'test_helper'

class ServicioSaludTest < Test::Unit::TestCase
  def setup
    @servicio = ServicioSalud.new(1, "hospital", Hora.new(8, 0, 0), Hora.new(20, 0, 30), [Fecha.new(2024, 1, 1), Fecha.new(2024, 12, 6)])
    @paciente = Paciente.new(1, "Juan", "García", "Hombre", Fecha.new(1980, 1, 1), 1)
    @medico = Medico.new(1, "Pedro", "López", "Hombre", Fecha.new(1970, 1, 1), "12345678A")
    @servicio.medicos << @medico
  end

  def test_servicio_salud
    assert_equal 1, @servicio.codigo_identificacion
    assert_equal "hospital", @servicio.descripcion
    assert_equal Hora.new(8, 0, 0), @servicio.horario_apertura
    assert_equal Hora.new(20, 0, 30), @servicio.horario_cierre
    assert_equal [Fecha.new(2024, 1, 1), Fecha.new(2024, 12, 6)], @servicio.calendario_festivos
    assert_equal [@medico], @servicio.medicos
  end

  def test_to_s
    assert_equal "1 - hospital - 08:00:00 - 20:00:30 - [2024-01-01, 2024-12-06]", @servicio.to_s
  end

  def test_asignar_paciente_a_cama
    @servicio.asignar_paciente_a_cama(@paciente, 1)
    assert_equal@paciente, @servicio.camas_estandar[1]
    assert_raise(RuntimeError) { @servicio.asignar_paciente_a_cama(@paciente, 1) }
  end

  def test_duracion_ocupacion_cama
    @servicio.asignar_paciente_a_cama(@paciente, 1)
    assert_equal 1, @servicio.duracion_ocupacion_cama(1, Fecha.new(2020, 1, 1), Fecha.new(2020, 1, 2))
    assert_raise(RuntimeError) { @servicio.duracion_ocupacion_cama(2, Fecha.new(2020, 1, 1), Fecha.new(2020, 1, 3)) }
  end


end
