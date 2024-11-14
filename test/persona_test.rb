require 'test_helper'

class TestPersonas < Test::Unit::TestCase
  def setup
    @persona = Persona.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10))
    @paciente = Paciente.new(2, "Ana", "García", "Femenino", Fecha.new(1985, 8, 20), EMERGENCIA)
    @medico = Medico.new(3, "Laura", "Martínez", "Femenino", Fecha.new(1975, 3, 15), "Pediatría")

  end

  # def test_numero_personas
  #   assert_equal(3, numero_personas)
  # end

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

  def test_numero_pacientes_medico
    @medico.agregar_paciente(@paciente)
    assert_equal(1, @medico.numero_pacientes)


    paciente1 = Paciente.new(5, "Pedro", "Sánchez", "Masculino", Time.new(1992, 1, 1), "Nivel III")
    paciente2 = Paciente.new(6, "María", "Hernández", "Femenino", Time.new(1994, 2, 2), "Nivel IV")
    @medico.agregar_paciente(paciente1)
    @medico.agregar_paciente(paciente2)
    assert_equal(3, @medico.numero_pacientes)
  end

end
