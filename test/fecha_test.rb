require 'test_helper'

class TestFecha < Test::Unit::TestCase
  def setup
    @fecha1 = Fecha.new(2024, 2, 28)
  end

  def test_initializer
    assert_equal(2024, @fecha1.anio, "Debería devolver el valor 2024 de la variable anio")
    assert_equal(2, @fecha1.mes, "Debería devolver el valor 2 de la variable mes")
    assert_equal(28, @fecha1.dia, "Debería devolver el valor 29 de la variable dia")
  end

  def test_initializer_invalido
    # Verificar que se lanza un error si el año es menor o igual a 0
    assert_raises(ArgumentError) { Fecha.new(0, 5, 15) }
    assert_raises(ArgumentError) { Fecha.new(-2024, 5, 15) }

    # Verificar que se lanza un error si el mes está fuera de rango
    assert_raises(ArgumentError) { Fecha.new(2024, 13, 15) }  # Mes 13 no es válido
    assert_raises(ArgumentError) { Fecha.new(2024, 0, 15) }    # Mes 0 no es válido

    # Verificar que se lanza un error si el día está fuera de rango para un mes
    assert_raises(ArgumentError) { Fecha.new(2024, 2, 30) }  # Febrero no tiene 30 días
    assert_raises(ArgumentError) { Fecha.new(2024, 4, 31) }  # Abril solo tiene 30 días
  end

  

end
