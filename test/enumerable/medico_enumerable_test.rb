require 'test_helper'

class TestEnumerableMedico < Test::Unit::TestCase
  def setup
    # Crear pacientes con algunos diagnósticos
    @paciente1 = Paciente.new("1", "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 15), 2)
    @paciente1.agregar_diagnostico("Gripe")
    @paciente1.agregar_diagnostico("Dolor de cabeza")

    @paciente2 = Paciente.new("2", "Ana", "García", "Femenino", Fecha.new(1985, 8, 25), 1)
    @paciente2.agregar_diagnostico("Fiebre alta")
    @paciente2.agregar_diagnostico("Tos")

    # Crear médico y asignarle pacientes
    @medico = Medico.new("1", "Dr. Smith", "Johnson", "Masculino", Fecha.new(1980, 3, 10), "Cardiología")
    @medico.agregar_paciente(@paciente1)
    @medico.agregar_paciente(@paciente2)
  end

  # Test de select: seleccionar pacientes mayores de 30 años
  def test_select
    pacientes_mayores_30 = @medico.select { |paciente| paciente.edad > 30 }
    assert_equal ["Juan Pérez", "Ana García"], pacientes_mayores_30.map(&:nombre_completo)
  end

  # Test de map: obtener los nombres completos de los pacientes
  def test_map
    nombres_completos = @medico.map { |paciente| paciente.nombre_completo }
    assert_equal ["Juan Pérez", "Ana García"], nombres_completos
  end

  # Test de sort_by: ordenar pacientes por nombre
  def test_sort_by
    pacientes_ordenados = @medico.sort_by { |paciente| paciente.nombre_completo }
    assert_equal ["Ana García", "Juan Pérez"], pacientes_ordenados.map(&:nombre_completo)
  end

  # Test de find: encontrar un paciente por su nombre
  def test_find
    paciente_encontrado = @medico.find { |paciente| paciente.nombre_completo == "Ana García" }
    assert_equal "Ana García", paciente_encontrado.nombre_completo
  end

  # Test de reject: excluir pacientes cuyo nombre no contiene "Juan"
  def test_reject
    pacientes_sin_juan = @medico.reject { |paciente| paciente.nombre_completo.include?("Juan") }
    assert_equal ["Ana García"], pacientes_sin_juan.map(&:nombre_completo)
  end
end
