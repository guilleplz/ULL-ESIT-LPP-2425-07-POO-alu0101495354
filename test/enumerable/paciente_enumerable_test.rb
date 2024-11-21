require 'test_helper'

class TestEnumerablePaciente < Test::Unit::TestCase
  def setup
    # Crear pacientes con algunos diagnósticos
    @paciente1 = Paciente.new("1", "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 15), 2)
    @paciente1.agregar_diagnostico("Gripe")
    @paciente1.agregar_diagnostico("Dolor de cabeza")

    @paciente2 = Paciente.new("2", "Ana", "García", "Femenino", Fecha.new(1985, 8, 25), 1)
    @paciente2.agregar_diagnostico("Fiebre alta")
    @paciente2.agregar_diagnostico("Tos")
  end

  # Test de select: seleccionar solo diagnósticos que contienen "Dolor"
  def test_select
    resultados = @paciente1.select { |diagnostico| diagnostico.include?("Dolor") }
    assert_equal ["Dolor de cabeza"], resultados
  end

  # Test de map: cambiar todos los diagnósticos a mayúsculas
  def test_map
    resultados = @paciente1.map { |diagnostico| diagnostico.upcase }
    assert_equal ["GRIPE", "DOLOR DE CABEZA"], resultados
  end

  # Test de sort: ordenar los diagnósticos alfabéticamente
  def test_sort
    resultados = @paciente1.sort
    assert_equal ["Dolor de cabeza", "Gripe"], resultados
  end

  # Test de all? : verificar si todos los diagnósticos incluyen la palabra "alta"
  def test_all?
    resultados = @paciente2.all? { |diagnostico| diagnostico.include?("alta") }
    assert_equal false, resultados  # No todos los diagnósticos contienen "alta"
  end

  # Test de any? : verificar si al menos un diagnóstico contiene la palabra "Tos"
  def test_any?
    resultados = @paciente2.any? { |diagnostico| diagnostico.include?("Tos") }
    assert_equal true, resultados  # Al menos uno de los diagnósticos contiene "Tos"
  end
end
