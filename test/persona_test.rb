require 'test_helper'

class TestPersonas < Test::Unit::TestCase
  def setup
    @persona = Persona.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10))
    @paciente = Paciente.new(2, "Ana", "García", "Femenino", Fecha.new(1985, 8, 20), EMERGENCIA)
    @medico = Medico.new(3, "Laura", "Martínez", "Femenino", Fecha.new(1975, 3, 15), "Pediatría")
    @titular = Titular.new(4, "Carlos", "López", "Masculino", Fecha.new(1980, 10, 25), "Geriatría", 3)
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


    paciente1 = Paciente.new(5, "Pedro", "Sánchez", "Masculino", Time.new(1992, 1, 1), REANIMACION)
    paciente2 = Paciente.new(6, "María", "Hernández", "Femenino", Time.new(1994, 2, 2), NO_URGENTE)
    @medico.agregar_paciente(paciente1)
    @medico.agregar_paciente(paciente2)
    assert_equal(3, @medico.numero_pacientes)
  end

  def test_carga_maxima_titular
    paciente1 = Paciente.new(7, "Luis", "Ramos", "Masculino", Time.new(1988, 3, 3), NO_URGENTE)
    paciente2 = Paciente.new(8, "Eva", "Domínguez", "Femenino", Time.new(1990, 4, 4), EMERGENCIA)
    paciente3 = Paciente.new(9, "Sonia", "Vargas", "Femenino", Time.new(1985, 5, 5), REANIMACION)
    @titular.agregar_paciente(paciente1)
    @titular.agregar_paciente(paciente2)
    @titular.agregar_paciente(paciente3)
    assert(@titular.carga_maxima?)
  end



end
