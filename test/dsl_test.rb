require 'test_helper'
require 'stringio'

class ServicioSaludDSLTest < Test::Unit::TestCase

  def setup
    @dsl = ServicioSaludDSL.new do
      registrar_servicio 'servicio_salud', 'SALUD001', 'Servicio de salud general', Hora.new(9, 0, 0), Hora.new(20, 0, 0), [Fecha.new(2021, 12, 25)], 10
      registrar_servicio 'servicio_urgencias', 'URGEN001', 'Servicio de urgencias', Hora.new(9, 0, 0), Hora.new(20, 0, 0), [Fecha.new(2021, 12, 25)], 15, 5
      registrar_servicio 'servicio_hospitalizacion', 'HOSP001', 'Servicio de hospitalización', Hora.new(9, 0, 0), Hora.new(20, 0, 0), [Fecha.new(2021, 12, 25)], 20, 5
      solicitar_servicio 'SALUD001', '12345678A', 'Juan', 'García', 'H', Fecha.new(1980, 1, 1), 1
      solicitar_servicio 'URGEN001', '87654321B', 'María', 'López', 'M', Fecha.new(1990, 2, 2), 2
      solicitar_servicio 'HOSP001', '12345678A', 'Juan', 'García', 'H', Fecha.new(1980, 1, 1), 1
      solicitar_servicio 'HOSP001', '87654321B', 'María', 'López', 'M', Fecha.new(1990, 2, 2), 2
    end
  end

  def test_registrar_servicio
    assert_equal 3, @dsl.instance_variable_get(:@proveedores).length
    @dsl.registrar_servicio 'servicio_salud', 'SALUD002', 'Servicio de salud general', '09:00', '20:00', ['2021-12-25'], 10
    assert_equal 4, @dsl.instance_variable_get(:@proveedores).length
  end

  def test_solicitar_servicio
    assert_equal 4, @dsl.instance_variable_get(:@solicitados).length
    @dsl.solicitar_servicio 'SALUD001', '12345678A', 'Juan', 'García', 'H', '1980-01-01', 1
    assert_equal 5, @dsl.instance_variable_get(:@solicitados).length
  end

  def test_status
    # Captura la salida estándar
    captured_output = StringIO.new
    $stdout = captured_output

    @dsl.status

    # Restaura el valor original de $stdout
    $stdout = STDOUT

    expected_output = "Estado del sistema sanitario:\n" +
                      "Proveedor: SALUD001 - Servicio de salud general - 09:00:00 - 20:00:00 - [2021-12-25]\n" +
                      "  Paciente: Juan García, H, 44 años - Prioridad: 1\n" +
                      "Proveedor: URGEN001 - Servicio de urgencias - 09:00:00 - 20:00:00 - [2021-12-25]Camas UCI disponibles: 5\n" +
                      "  Paciente: María López, M, 34 años - Prioridad: 2\n" +
                      "Proveedor: HOSP001 - Servicio de hospitalización - 09:00:00 - 20:00:00 - [2021-12-25]\n" +
                      "  Paciente: Juan García, H, 44 años - Prioridad: 1\n" +
                      "  Paciente: María López, M, 34 años - Prioridad: 2\n"
    assert_equal(expected_output, captured_output.string)
  end

  def test_herencia
    assert_equal true, @dsl.is_a?(Object)
    assert_equal true, @dsl.is_a?(BasicObject)
    assert_equal true, @dsl.is_a?(ServicioSaludDSL)
  end

end
