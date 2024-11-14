require 'test_helper'

class TestPersonas < Test::Unit::TestCase
  def setup
    @persona = Persona.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10))
  end

  def test_numero_personas
    assert_equal(1, Persona.numero_personas)
  end

  def test_calcula_edad
    assert_equal(34, @persona.edad)
  end

  def test_to_s
    assert_equal("Juan Pérez, Masculino, 34 años", @persona.to_s)
  end

end
