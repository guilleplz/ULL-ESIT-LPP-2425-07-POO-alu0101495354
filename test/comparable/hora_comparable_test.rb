require 'test_helper'

class TestComparableHora < Test::Unit::TestCase
  # Este es el método setup que se ejecuta antes de cada prueba
  def setup
    # Creamos las instancias de Hora para usarlas en las pruebas
    @hora1 = Hora.new(10, 30, 45)
    @hora2 = Hora.new(10, 30, 45)
    @hora3 = Hora.new(10, 31, 45)
    @hora4 = Hora.new(9, 30, 45)
    @hora5 = Hora.new(10, 29, 45)
    @hora6 = Hora.new(10, 30, 46)
  end

  # Test para comparar dos horas iguales
  def test_comparacion_igual
    assert(@hora1 == @hora2)  # Deberían ser iguales
  end

  # Test para comparar una hora menor
  def test_comparacion_menor
    assert(@hora1 < @hora3)  # @hora1 es menor que @hora3 porque el minuto es menor
  end

  # Test para comparar una hora mayor
  def test_comparacion_mayor
    assert(@hora1 > @hora5)  # @hora1 es mayor que @hora5 porque el minuto es mayor
  end

  # Test para comparar con segundos
  def test_comparacion_con_segundos
    assert(@hora1 < @hora6)  # @hora1 es menor que @hora6 porque los segundos son menores
  end

  # Test para comparar hora menor
  def test_comparacion_hora_menor
    assert(@hora4 < @hora1)  # @hora4 es menor que @hora1 porque la hora es menor
  end

  # Test para comparar hora mayor
  def test_comparacion_hora_mayor
    assert(@hora1 > @hora4)  # @hora1 es mayor que @hora4 porque la hora es mayor
  end

  def test_hora_between
    assert(@hora1.between?(@hora5, @hora3))  # @hora1 está entre @hora5 y @hora3
  end
end
