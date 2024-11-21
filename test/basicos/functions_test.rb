require 'test_helper'

class TestFunctions < Test::Unit::TestCase
  def setup
    @hora_actual = Time.now # recuperamos la hora actual para poder restarle el tiempo y realizar los test dentro de un limite
  end

  def test_nivel_prioridad_nivel_i
    # Hora de entrada a 5 minutos antes de la hora actual
    hora_entrada = @hora_actual - 5 * 60
    assert_equal 'Nivel I (Azul) - Reanimación, atención inmediata', nivel_prioridad(hora_entrada)
  end

  def test_nivel_prioridad_nivel_ii
    # Hora de entrada a 15 minutos antes de la hora actual
    hora_entrada = @hora_actual - 15 * 60
    assert_equal 'Nivel II (Rojo) - Emergencia, atención en 7 minutos', nivel_prioridad(hora_entrada)
  end

  def test_nivel_prioridad_nivel_iii
    # Hora de entrada a 35 minutos antes de la hora actual
    hora_entrada = @hora_actual - 35 * 60
    assert_equal 'Nivel III (Naranja) - Urgente, atención en 30 minutos', nivel_prioridad(hora_entrada)
  end

  def test_nivel_prioridad_nivel_iv
    # Hora de entrada a 50 minutos antes de la hora actual
    hora_entrada = @hora_actual - 50 * 60
    assert_equal 'Nivel IV (Verde) - Menos urgente, atención en 45 minutos', nivel_prioridad(hora_entrada)
  end

  def test_nivel_prioridad_nivel_v
    # Hora de entrada a 75 minutos antes de la hora actual
    hora_entrada = @hora_actual - 75 * 60
    assert_equal 'Nivel V (Negro) - No urgente, atención en 60 minutos', nivel_prioridad(hora_entrada)
  end
end
