class TestPaciente < Test::Unit::TestCase
  def setup
    # Creamos algunos pacientes con diferentes prioridades
    @paciente1 = Paciente.new("1", "Juan", "Pérez", "Masculino", Fecha.new(1990, 1, 1), 2)
    @paciente2 = Paciente.new("2", "Ana", "López", "Femenino", Fecha.new(1985, 5, 5), 1)
    @paciente3 = Paciente.new("3", "Carlos", "González", "Masculino", Fecha.new(2000, 3, 10), 3)
    @paciente4 = Paciente.new("4", "Laura", "Martínez", "Femenino", Fecha.new(1990, 1, 1), 2)  # Igual a @paciente1
  end

  # Test para comparar pacientes por su prioridad
  def test_comparacion_prioridad_menor
    assert(@paciente2 < @paciente1)  # @paciente2 tiene mayor prioridad (1) que @paciente1 (2)
  end

  def test_comparacion_prioridad_mayor
    assert(@paciente1 < @paciente3)  # @paciente1 tiene menor prioridad (2) que @paciente3 (3)
  end

  def test_comparacion_prioridad_igual
    assert(@paciente1 == @paciente4)  # @paciente1 y @paciente4 tienen la misma prioridad (2)
  end

  def test_comparacion_igualdad
    paciente_a = Paciente.new("5", "Carlos", "González", "Masculino", Fecha.new(2000, 3, 10), 3)
    paciente_b = Paciente.new("6", "Carlos", "González", "Masculino", Fecha.new(2000, 3, 10), 3)
    assert_equal(paciente_a, paciente_b)  # Ambos pacientes tienen la misma prioridad y fecha de nacimiento
  end

  def test_agregar_diagnostico
    @paciente1.agregar_diagnostico("Fiebre alta")
    assert_equal("Fiebre alta", @paciente1.ultimo_diagnostico)
  end
end
