require 'test_helper'

class TestEnumerableHora < Test::Unit::TestCase
  def setup
    @hora = Hora.new(10, 30, 45)
  end

  # Test para verificar el método each
  def test_each
    componentes = []
    @hora.each { |componente| componentes << componente }
    assert_equal [10, 30, 45], componentes
  end

  # Test para map: incrementar cada componente de la hora en 1
  def test_map
    componentes_incrementados = @hora.map { |componente| componente + 1 }
    assert_equal [11, 31, 46], componentes_incrementados
  end

  # Test para select: seleccionar solo los componentes mayores a 30
  def test_select
    componentes_mayores_30 = @hora.select { |componente| componente > 30 }
    assert_equal [45], componentes_mayores_30
  end

  # Test para diferencia de segundos entre dos horas
  def test_diferencia_segundos
    hora_otra = Hora.new(9, 45, 30)
    diferencia = @hora.diferencia_segundos(hora_otra)
    assert_equal 2715, diferencia
  end
end
