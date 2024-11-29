require 'test_helper'

class Functions_test < Test::Unit::TestCase
  def setup
    # Crear servicios de urgencias
    @servicio1 = ServicioUrgencias.new(
      1, "Urgencias Norte", Hora.new(8, 0, 0), Hora.new(22, 0, 0),
      [Fecha.new(2024, 1, 1), Fecha.new(2024, 12, 25)], 5
    )
    @servicio2 = ServicioUrgencias.new(
      2, "Urgencias Sur", Hora.new(6, 0, 0), Hora.new(20, 0, 0),
      [Fecha.new(2024, 4, 1)], 3
    )

    # Añadir médicos y camas
    @servicio1.medicos << Medico.new(1, "Pedro", "López", "Hombre", Fecha.new(1970, 1, 1), "Cardiología")
    @servicio2.medicos << Medico.new(2, "Ana", "Martínez", "Mujer", Fecha.new(1985, 3, 15), "Pediatría")

    @servicio1.camas_estandar[101] = Paciente.new(1, "Juan", "Pérez", "Hombre", Fecha.new(1990, 5, 10), 1)
    @servicio2.camas_estandar[201] = Paciente.new(2, "Laura", "Gómez", "Mujer", Fecha.new(1995, 8, 20), 2)
  end

  def test_fusion_correcta
    servicio_fusionado = fusionar_servicios(@servicio1, @servicio2)

    # Verificar código y descripción
    assert_equal("1-2", servicio_fusionado.codigo_identificacion)
    assert_equal("Urgencias Norte & Urgencias Sur", servicio_fusionado.descripcion)

    # Verificar horarios
    assert_equal(Hora.new(6, 0, 0), servicio_fusionado.horario_apertura)
    assert_equal(Hora.new(22, 0, 0), servicio_fusionado.horario_cierre)

    # Verificar calendario de festivos
    assert_equal([Fecha.new(2024, 1, 1), Fecha.new(2024, 12, 25), Fecha.new(2024, 4, 1)].sort,
                 servicio_fusionado.calendario_festivos.sort)

    # Verificar médicos
    assert_equal(2, servicio_fusionado.medicos.size)
    assert_equal(["Ana Martínez", "Pedro López"], servicio_fusionado.medicos.map(&:nombre_completo).sort)

    # Verificar camas estándar
    assert_equal(2, servicio_fusionado.camas_estandar.size)
    assert_equal(["Juan Pérez", "Laura Gómez"], servicio_fusionado.camas_estandar.values.map(&:nombre_completo).sort)


    # Verificar camas UCI
    assert_equal(8, servicio_fusionado.camas_uci_disponibles)
  end
end
