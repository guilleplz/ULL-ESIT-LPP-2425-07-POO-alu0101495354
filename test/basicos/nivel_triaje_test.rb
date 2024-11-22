require 'test_helper'


class TestNivelTriaje < Test::Unit::TestCase

  def setup
    @nivel1 = NivelTriaje.new(1)
    @nivel2 = NivelTriaje.new(2)
    @nivel3 = NivelTriaje.new(3)
    @nivel4 = NivelTriaje.new(4)
    @nivel5 = NivelTriaje.new(5)
    @nivel6 = NivelTriaje.new(6)
    @nivel7 = NivelTriaje.new("algo")
  end

  def test_initialize
    assert_equal(1, @nivel1.nivel)
  end

  def test_nivel_reanimacion
    assert_equal("Reanimacion", @nivel1.nivel_prioridad, "el nivel 1 debe ser reanimacion")
  end

  def test_nivel_emergencia
    assert_equal("Emergencia", @nivel2.nivel_prioridad, "el nivel 2 debe ser emergencia")
  end

  def test_nivel_urgente
    assert_equal("Urgente", @nivel3.nivel_prioridad, "el nivel 3 debe ser urgente")
  end

  def test_nivel_menos_urgente
    assert_equal("Menos urgente", @nivel4.nivel_prioridad, "el nivel 4 debe ser menos urgente")
  end

  def test_nivel_no_urgente
    assert_equal("No urgente", @nivel5.nivel_prioridad, "el nivel 5 debe ser no urgente")
  end

  def test_nivel_fuera_rango
    assert_equal("Desconocido", @nivel6.nivel_prioridad, "el nivel 6 no debería conocerse, está fuera de rango")
  end

  def test_tipo_dato_distinto
    assert_equal("Desconocido", @nivel7.nivel_prioridad, "no se admiten otros tipos de datos")
  end

end
