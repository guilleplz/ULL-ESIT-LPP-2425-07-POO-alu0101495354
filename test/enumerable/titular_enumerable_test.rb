require 'test_helper'

class TestEnumerableTitular < Test::Unit::TestCase
  def setup
    # Creamos instancias de Paciente
    @paciente1 = Paciente.new("1", "Juan", "Pérez", "Masculino", Fecha.new(1990, 5, 12), 1)
    @paciente2 = Paciente.new("2", "Laura", "González", "Femenino", Fecha.new(1985, 3, 20), 2)
    @paciente3 = Paciente.new("3", "Carlos", "Ramírez", "Masculino", Fecha.new(1992, 8, 7), 3)

    # Creamos una instancia de Titular
    @titular = Titular.new("T1", "Dr. José", "Martínez", "Masculino", Fecha.new(1975, 6, 25), "Cardiología", 3)

    # Asignamos pacientes al titular
    @titular.agregar_paciente(@paciente1)
    @titular.agregar_paciente(@paciente2)
    @titular.agregar_paciente(@paciente3)
  end

  # Test para verificar que podemos iterar sobre los pacientes del titular
  def test_each
    pacientes_nombres = @titular.map { |paciente| paciente.nombre_completo }
    assert_equal ["Juan Pérez", "Laura González", "Carlos Ramírez"], pacientes_nombres
  end

  # Test para verificar el uso de select: seleccionar pacientes con prioridad mayor que 1
  def test_select
    pacientes_prioridad_mayor_1 = @titular.select { |paciente| paciente.prioridad > 1 }
    assert_equal [@paciente2, @paciente3], pacientes_prioridad_mayor_1
  end

  # Test para verificar el uso de reject: rechazar pacientes con prioridad menor o igual que 1
  def test_reject
    pacientes_rechazados = @titular.reject { |paciente| paciente.prioridad <= 1 }
    assert_equal [@paciente2, @paciente3], pacientes_rechazados
  end

  # Test para verificar el uso de find: encontrar un paciente con prioridad mayor a 1
  def test_find
    paciente_encontrado = @titular.find { |paciente| paciente.prioridad > 1 }
    assert_equal @paciente2, paciente_encontrado
  end

  # Test para verificar el uso de sort: ordenar los pacientes por su nombre
  def test_sort
    pacientes_ordenados = @titular.sort_by { |paciente| paciente.get_fecha_nacimiento }
    assert_equal [@paciente2, @paciente1, @paciente3], pacientes_ordenados
  end
end
