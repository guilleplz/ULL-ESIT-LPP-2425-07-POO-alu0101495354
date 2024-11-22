require 'test_helper'

class TestTitularComparable < Test::Unit::TestCase
  def setup
    # Inicializamos algunas instancias de Titular con distintos valores para max_pacientes
    fecha_nacimiento = Fecha.new(1985, 5, 15)
    @titular1 = Titular.new("1", "Juan", "Pérez", "Masculino", fecha_nacimiento, "Cardiología", 10)
    @titular2 = Titular.new("2", "María", "González", "Femenino", fecha_nacimiento, "Neurología", 5)
    @titular3 = Titular.new("3", "Carlos", "López", "Masculino", fecha_nacimiento, "Pediatría", 10)
    @titular4 = Titular.new("4", "Carla", "Pascuales", "Femenino", fecha_nacimiento, "Pediatría", 11)
  end

  # Test para verificar que los titulares se comparan correctamente
  def test_comparar_titulares
    # Comprobamos que titular1 tiene más capacidad que titular2
    assert(@titular1 > @titular2, "Titular1 debería ser mayor que Titular2")

    # Comprobamos que titular1 es igual a titular3 (tienen el mismo max_pacientes)
    assert(@titular1 == @titular3, "Titular1 debería ser igual que Titular3")

    # Comprobamos que titular2 es menor que titular1
    assert(@titular2 < @titular1, "Titular2 debería ser menor que Titular1")

    assert_equal(true, @titular3.between?(@titular2, @titular4))
  end
end
