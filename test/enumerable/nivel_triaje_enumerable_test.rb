require 'test_helper'

class TestEnumerableNivelTriaje < Test::Unit::TestCase
  def setup
    @nivel1 = NivelTriaje.new(1)  # Reanimación
    @nivel2 = NivelTriaje.new(2)  # Emergencia
    @nivel3 = NivelTriaje.new(3)  # Urgente
    @nivel4 = NivelTriaje.new(4)  # Menos urgente
    @nivel5 = NivelTriaje.new(5)  # No urgente
  end

  # Test para verificar el método each
  def test_each
    niveles = []
    [@nivel1, @nivel2, @nivel3, @nivel4, @nivel5].each { |nivel| niveles << nivel.nivel }
    assert_equal [1, 2, 3, 4, 5], niveles
  end

  # Test para map: aplicar una transformación a los niveles (sumar 1)
  def test_map
    niveles_incrementados = [@nivel1, @nivel2, @nivel3, @nivel4, @nivel5].map { |nivel| nivel.nivel + 1 }
    assert_equal [2, 3, 4, 5, 6], niveles_incrementados
  end

  # Test para select: seleccionar solo los niveles mayores a 3
  def test_select
    niveles_mayores_3 = [@nivel1, @nivel2, @nivel3, @nivel4, @nivel5].select { |nivel| nivel.nivel > 3 }
    assert_equal [4, 5], niveles_mayores_3.map(&:nivel)
  end

  # Test para ordenar los niveles de triaje
  def test_sort
    niveles_ordenados = [@nivel1, @nivel2, @nivel3, @nivel4, @nivel5].sort
    assert_equal [1, 2, 3, 4, 5], niveles_ordenados.map(&:nivel)
  end
end
