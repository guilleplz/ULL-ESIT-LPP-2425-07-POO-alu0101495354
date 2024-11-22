require 'test_helper'

class TestComparableMedico < Test::Unit::TestCase
  def setup
    # Creamos algunos médicos con diferentes números de pacientes
    @medico1 = Medico.new("1", "Dr. Juan", "Pérez", "Masculino", Fecha.new(1980, 1, 1), "Cardiología")
    @medico2 = Medico.new("2", "Dr. Ana", "López", "Femenino", Fecha.new(1975, 5, 5), "Pediatría")
    @medico3 = Medico.new("3", "Dr. Carlos", "González", "Masculino", Fecha.new(1990, 3, 10), "Neurología")
    @medico4 = Medico.new("4", "Dr. Laura", "Martínez", "Femenino", Fecha.new(1985, 6, 12), "Ginecología")

    # Añadimos pacientes a los médicos
    @paciente1 = Paciente.new("1", "Juan", "Pérez", "Masculino", Fecha.new(1990, 1, 1), 2)
    @paciente2 = Paciente.new("2", "Ana", "López", "Femenino", Fecha.new(1985, 5, 5), 1)
    @paciente3 = Paciente.new("3", "Carlos", "González", "Masculino", Fecha.new(2000, 3, 10), 3)

    # Asignamos pacientes a los médicos
    @medico1.agregar_paciente(@paciente1)
    @medico1.agregar_paciente(@paciente2)

    @medico2.agregar_paciente(@paciente3)

    @medico3.agregar_paciente(@paciente1)
    @medico3.agregar_paciente(@paciente2)
    @medico3.agregar_paciente(@paciente3)

    @medico4.agregar_paciente(@paciente1)
    @medico4.agregar_paciente(@paciente2)
  end

  # Test para comparar médicos por número de pacientes
  def test_comparacion_menor_pacientes
    assert(@medico1 < @medico3)  # @medico1 tiene menos pacientes que @medico3
  end

  def test_comparacion_mayor_pacientes
    assert(@medico3 > @medico2)  # @medico3 tiene más pacientes que @medico2
  end

  def test_comparacion_igual_pacientes
    assert(@medico1 == @medico4)  # @medico1 y @medico4 tienen el mismo número de pacientes
  end

  def test_comparacion_menor_igual_pacientes
    # Comprobamos que @medico1 tiene entre 2 y 3 pacientes
    assert(@medico1.between?(@medico2, @medico3))
    # Los médicos con menos de 3 pacientes, deben ser comparados con el número mínimo y máximo
  end

end
