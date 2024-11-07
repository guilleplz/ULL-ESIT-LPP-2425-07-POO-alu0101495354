require 'test_helper'

class TestHora < Test::Unit::TestCase
  def setup
    @hora1 = Hora.new(12, 34, 54)

  end

  def test_initialize
    assert_equal(12, @hora1.hora, "debería recuperar el valor 12 de las horas")
    assert_equal(34, @hora1.minuto, "debería recuperar el valor 34 de los minutos")
    assert_equal(54, @hora1.segundo, "debería recuperar el valor 54 de los segundos")
  end

  def test_initialize_fuera_rango
    assert_raises(ArgumentError) { Hora.new(25, 10, 30) }
  end

end
