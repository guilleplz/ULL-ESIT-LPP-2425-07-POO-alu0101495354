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

<<<<<<< HEAD
<<<<<<< HEAD
  def test_herencias_persona
    assert_equal(true, @persona.is_a?(Object))
    assert_equal(true, @persona.is_a?(BasicObject))
  end

  def test_herencias_paciente
    assert_equal(true, @paciente.is_a?(Object))
    assert_equal(true, @paciente.is_a?(BasicObject))
    assert_equal(true, @paciente.is_a?(Persona))
  end

  def test_herencias_medico
    assert_equal(true, @medico.is_a?(Object))
    assert_equal(true, @medico.is_a?(BasicObject))
    assert_equal(true, @medico.is_a?(Persona))
  end

  def test_herencias_titular
    assert_equal(true, @titular.is_a?(Object))
    assert_equal(true, @titular.is_a?(BasicObject))
    assert_equal(true, @titular.is_a?(Persona))
=======
  def test_herencias
    assert_equal(true, @paciente.is_a?(Persona))
    assert_equal(true, @medico.is_a?(Persona))
    assert_equal(true, @titular.is_a?(Persona))
    assert_equal(true, @titular.is_a?(Medico))
=======
  def test_herencias_persona
>>>>>>> 9376bc1 (documentación)
    assert_equal(true, @persona.is_a?(Object))
    assert_equal(true, @persona.is_a?(BasicObject))
  end

<<<<<<< HEAD
>>>>>>> 6e21746 (test herencia)
=======
  def test_herencias_paciente
    assert_equal(true, @paciente.is_a?(Object))
    assert_equal(true, @paciente.is_a?(BasicObject))
    assert_equal(true, @paciente.is_a?(Persona))
  end

  def test_herencias_medico
    assert_equal(true, @medico.is_a?(Object))
    assert_equal(true, @medico.is_a?(BasicObject))
    assert_equal(true, @medico.is_a?(Persona))
  end

  def test_herencias_titular
    assert_equal(true, @titular.is_a?(Object))
    assert_equal(true, @titular.is_a?(BasicObject))
    assert_equal(true, @titular.is_a?(Persona))
>>>>>>> 9376bc1 (documentación)
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

  def test_igualdad_entre_objetos
    persona_igual = Persona.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10))
    assert(@persona == persona_igual)
  end

  def test_igualdad_entre_persona_y_paciente
    persona = Persona.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10))
    paciente = Paciente.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10), EMERGENCIA)

    assert(persona == paciente)  # Ahora debería pasar
  end

  def test_igualdad_entre_persona_y_medico
    persona = Persona.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10))
    medico = Medico.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10), "General")

    assert(persona == medico)  # Ahora debería pasar
  end

  def test_igualdad_entre_persona_y_titular
    persona = Persona.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10))
    titular = Titular.new(1, "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 10), "General", 2)

    assert(persona == titular)  # Ahora debería pasar
  end


end
