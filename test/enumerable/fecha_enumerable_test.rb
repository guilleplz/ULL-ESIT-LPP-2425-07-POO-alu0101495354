class TestEnumerableFecha < Test::Unit::TestCase
  def setup
    @fecha = Fecha.new(2024, 11, 21)
  end

  # Test para verificar el método each
  def test_each
    componentes = []
    @fecha.each { |componente| componentes << componente }
    assert_equal [2024, 11, 21], componentes
  end

  # Test para map: incrementar cada componente de la fecha en 1
  def test_map
    componentes_incrementados = @fecha.map { |componente| componente + 1 }
    assert_equal [2025, 12, 22], componentes_incrementados
  end

  # Test para select: seleccionar solo los componentes mayores a 20
  def test_select
    componentes_mayores_20 = @fecha.select { |componente| componente > 20 }
    assert_equal [2024, 21], componentes_mayores_20
  end

  # Test para sort: ordenar los componentes de la fecha
  def test_sort
    componentes_ordenados = @fecha.sort
    assert_equal [11, 21, 2024], componentes_ordenados
  end

  # Test para reduce: sumar todos los componentes de la fecha
  def test_reduce
    suma_componentes = @fecha.reduce(0) { |sum, componente| sum + componente }
    assert_equal 2056, suma_componentes
  end
end
