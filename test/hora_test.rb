require 'test_helper'

class TestHora < Test::Unit::TestCase
  def setup
    @hora1 = Hora.new(12, 34, 54)
    @hora2 = Hora.new(10, 30, 45)
    @hora3 = Hora.new(12, 45, 55)
    @hora4 = Hora.new(10, 31, 10)

  end

  def test_initialize
    assert_equal(12, @hora1.hora, "debería recuperar el valor 12 de las horas")
    assert_equal(34, @hora1.minuto, "debería recuperar el valor 34 de los minutos")
    assert_equal(54, @hora1.segundo, "debería recuperar el valor 54 de los segundos")
  end

  def test_initialize_fuera_rango
    assert_raises(ArgumentError) { Hora.new(25, 10, 30) }
  end

  def test_diferencia_en_tiempo


    # Calcular la diferencia de tiempo
    diferencia = @hora2.diferencia_en_tiempo(@hora3)

    # Verificar que la diferencia es correcta
    assert_equal({ horas: 2, minutos: 15, segundos: 10 }, diferencia)
  end

  def test_diferencia_en_tiempo_con_segundos_negativos
    # Crear dos instancias de Hora donde los segundos sean negativos


    # Calcular la diferencia de tiempo
    diferencia = @hora2.diferencia_en_tiempo(@hora4)

    # Verificar que la diferencia es correcta
    assert_equal({ horas: 0, minutos: 0, segundos: 25 }, diferencia)
  end



end
