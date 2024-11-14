require 'test_helper'

class TestPersonas < Test::Unit::TestCase
  def setup
    @persona = Persona.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10))
    @paciente = Paciente.new(2, "Ana", "García", "Femenino", Fecha.new(1985, 8, 20), EMERGENCIA)

  end

  def test_numero_personas
    assert_equal(1, numero_personas / 2) # divido entre dos porque las clases en las pruebas se instancian 2 veces cada vez que la creas
  end

  def test_calcula_edad
    assert_equal(34, @persona.edad)
  end

  def test_to_s
    assert_equal("Juan Pérez, Masculino, 34 años", @persona.to_s)
  end

  def test_ultimo_diagnostico_paciente
    @paciente.agregar_diagnostico("grave")
    @paciente.agregar_diagnostico("muy grave")
    assert_equal("muy grave", @paciente.ultimo_diagnostico)
  end

end
