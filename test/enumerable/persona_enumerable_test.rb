require 'test_helper'

class TestEnumerablePersona < Test::Unit::TestCase
  def setup
    @persona1 = Persona.new("1", "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 12))
    @persona2 = Persona.new("2", "Laura", "González", "Femenino", Fecha.new(1985, 3, 5))
    @persona3 = Persona.new("3", "Carlos", "González", "Masculino", Fecha.new(2000, 10, 3))
  end

  # Test para verificar el método each
  def test_each
    atributos = []
    @persona1.each { |atributo| atributos << atributo }
    assert_equal ["1", "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 12)], atributos
  end

  # Test para map: transformar los nombres de las personas en mayúsculas
  def test_map
    personas = [@persona1, @persona2, @persona3]
    nombres_en_mayusculas = personas.map { |persona| persona.nombre_completo.upcase }
    assert_equal ["JUAN PÉREZ", "LAURA GONZÁLEZ", "CARLOS GONZÁLEZ"], nombres_en_mayusculas
  end

  # Test para select: seleccionar solo personas masculinas
  def test_select
    personas = [@persona1, @persona2, @persona3]
    hombres = personas.select { |persona| persona.sexo == "Masculino" }
    assert_equal [@persona1, @persona3], hombres
  end

  # Test para count: contar cuántas personas tienen más de 30 años
  def test_count
    personas = [@persona1, @persona2, @persona3]
    mayores_30 = personas.count { |persona| persona.edad > 30 }
    assert_equal 2, mayores_30
  end

  # Test para sort: ordenar las personas por fecha de nacimiento
  def test_sort
    personas = [@persona1, @persona2, @persona3]
    personas_ordenadas = personas.sort_by { |persona| persona.get_fecha_nacimiento }
    assert_equal [@persona2, @persona1, @persona3], personas_ordenadas
  end
end
