require 'test_helper'

class Comparable_test < Test::Unit::TestCase
  def setup
    @fecha1 = Fecha.new(2024, 1, 1)
    @fecha2 = Fecha.new(2024, 1, 2)
    @fecha3 = Fecha.new(2024, 1, 1)
  end

  def test_fecha_menor
    assert(@fecha1 < @fecha2, "Se esperaba que la fecha1 fuera menor que fecha2")
  end

  def test_fecha_mayor
    assert(@fecha2 > @fecha1, "Se esperaba que la fecha2 fuera mayor que fecha1")
  end

  def test_fecha_igual
    assert_equal(@fecha1, @fecha3, "Se esperaba que fecha1 y fecha3 fueran iguales")
  end

  def test_comparacion_igual
    assert_equal(0, @fecha1 <=> @fecha3, "El operador <=> no devolvió 0 para fechas iguales")
  end

  def test_comparacion_menor
    assert_equal(-1, @fecha1 <=> @fecha2, "El operador <=> no devolvió -1 cuando fecha1 es menor que fecha2")
  end

  def test_comparacion_mayor
    assert_equal(1, @fecha2 <=> @fecha1, "El operador <=> no devolvió 1 cuando fecha2 es mayor que fecha1")
  end

end
