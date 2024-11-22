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

  # Test para sort: ordenar los componentes de la hora
  def test_sort
    componentes_ordenados = @hora.sort
    assert_equal [10, 30, 45], componentes_ordenados
  end

  # Test para reduce: sumar todos los componentes de la hora
  def test_reduce
    suma_componentes = @hora.reduce(0) { |sum, componente| sum + componente }
    assert_equal 85, suma_componentes
  end
end
