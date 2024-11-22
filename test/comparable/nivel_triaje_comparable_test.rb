require 'test_helper'

class TestComparableNivelTriaje < Test::Unit::TestCase
  # Este método se ejecutará antes de cada prueba
  def setup
    @nivel1 = NivelTriaje.new(1)  # Reanimación
    @nivel2 = NivelTriaje.new(3)  # Urgente
    @nivel3 = NivelTriaje.new(5)  # No urgente
    @nivel4 = NivelTriaje.new(4)  # Menos urgente
  end

  # Test para verificar que un nivel más bajo (más urgente) es menor
  def test_comparacion_menor
    assert(@nivel1 < @nivel2)  # Nivel 1 es menor que Nivel 3
  end

  # Test para verificar que un nivel más alto (menos urgente) es mayor
  def test_comparacion_mayor
    assert(@nivel3 > @nivel1)  # Nivel 5 es mayor que Nivel 1
  end

  # Test para verificar la igualdad entre dos niveles iguales
  def test_comparacion_igual
    assert_equal(@nivel1, NivelTriaje.new(1))  # Nivel 1 es igual a Nivel 1
  end

  # Test para verificar que el nivel 1 es el más urgente
  def test_comparacion_urgencia
    assert(@nivel1 < @nivel3)  # Nivel 1 es más urgente que Nivel 5
  end

  def test_between
    assert_equal(true, @nivel2.between?(@nivel1, @nivel4))
  end
end
