require 'test_helper'

class TestPersona < Test::Unit::TestCase
  def setup
    # Creamos personas con distintas edades
    @persona1 = Persona.new("1", "Juan", "Pérez", "Masculino", Fecha.new(1990, 1, 1))
    @persona2 = Persona.new("2", "Ana", "López", "Femenino", Fecha.new(1985, 5, 5))
    @persona3 = Persona.new("3", "Carlos", "González", "Masculino", Fecha.new(2000, 3, 10))
    @persona4 = Persona.new("4", "Laura", "Martínez", "Femenino", Fecha.new(1990, 1, 1))
    @persona5 = Persona.new("5", "Carlos", "González", "Masculino", Fecha.new(2000, 3, 10))
  end

  # Test para comparar dos personas por su edad
  def test_comparacion_edad_menor
    assert(@persona1 < @persona2)  # La persona1 (Juan) es más joven que persona2 (Ana)
  end

  def test_comparacion_edad_mayor
    assert(@persona2 > @persona3)  # La persona2 (Ana) es mayor que persona3 (Carlos)
  end

  def test_comparacion_edad_igual
    assert(@persona1 == @persona4)  # La persona1 (Juan) tiene la misma edad que persona4 (Laura)
  end

  def test_comparacion_igualdad
    assert_equal(@persona3, @persona5)  # Persona3 y persona5 tienen la misma fecha de nacimiento
  end

end
