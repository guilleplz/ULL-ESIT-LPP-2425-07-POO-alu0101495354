require 'test_helper'

class Functions_test < Test::Unit::TestCase
  def setup
    # Crear servicios de urgencias
    @servicio1 = ServicioUrgencias.new(
      1, "Urgencias Norte", Hora.new(8, 0, 0), Hora.new(22, 0, 0),
      [Fecha.new(2024, 1, 1), Fecha.new(2024, 12, 25)], 10, 5
    )
    @servicio2 = ServicioUrgencias.new(
      2, "Urgencias Sur", Hora.new(6, 0, 0), Hora.new(20, 0, 0),
      [Fecha.new(2024, 4, 1)], 10,3
    )

    @servicio3 = ServicioUrgencias.new(
      3, "Urgencias Este", Hora.new(6, 0, 0), Hora.new(20, 0, 0),
      [Fecha.new(2024, 4, 1)], 10, 3
    )

    # Añadir médicos y camas
    @servicio1.medicos << Medico.new(1, "Pedro", "López", "Hombre", Fecha.new(1970, 1, 1), "Cardiología")
    @servicio2.medicos << Medico.new(2, "Ana", "Martínez", "Mujer", Fecha.new(1985, 3, 15), "Pediatría")
    @servicio2.medicos << Medico.new(3, "Juan", "García", "Hombre", Fecha.new(1990, 5, 5), "Medicina Interna")
    @servicio3.medicos << Medico.new(3, "Juan", "García", "Hombre", Fecha.new(1990, 5, 5), "Medicina Interna")

    @servicio1.asignar_paciente_a_cama(Paciente.new(1, "Juan", "Pérez", "Hombre", Fecha.new(1980, 10, 10), 1), 1, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 2), Hora.new(8, 0, 0))
    @servicio2.asignar_paciente_a_cama(Paciente.new(2, "Laura", "Gómez", "Mujer", Fecha.new(1990, 5, 5), 2), 2, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 1), Hora.new(8, 10, 0))
    @servicio2.asignar_paciente_a_cama(Paciente.new(3, "Carlos", "García", "Hombre", Fecha.new(1995, 5, 5), 3), 3, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 1), Hora.new(8, 1, 0))
    @servicio3.asignar_paciente_a_cama(Paciente.new(4, "Carlos", "García", "Hombre", Fecha.new(1995, 5, 5), 3), 4, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 1), Hora.new(8, 20, 0))


    @serviciouci1 = ServicioUrgencias.new(
      1, "Urgencias Norte", Hora.new(8, 0, 0), Hora.new(22, 0, 0),
      [Fecha.new(2024, 1, 1), Fecha.new(2024, 12, 25)], 10, 5
    )
    @serviciouci2 = ServicioUrgencias.new(
      2, "Urgencias Sur", Hora.new(6, 0, 0), Hora.new(20, 0, 0),
      [Fecha.new(2024, 4, 1)], 10, 3
    )
    @serviciouci3 = ServicioUrgencias.new(
      3, "Urgencias Este", Hora.new(6, 0, 0), Hora.new(20, 0, 0),
      [Fecha.new(2024, 4, 1)], 10, 3
    )

    @serviciouci1.medicos << Medico.new(1, "Pedro", "López", "Hombre", Fecha.new(1970, 1, 1), "Cardiología")
    @serviciouci2.medicos << Medico.new(2, "Ana", "Martínez", "Mujer", Fecha.new(1985, 3, 15), "Cardiología")
    @serviciouci2.medicos << Medico.new(3, "Juan", "García", "Hombre", Fecha.new(1990, 5, 5), "Medicina Interna")
    @serviciouci3.medicos << Medico.new(3, "Juan", "García", "Hombre", Fecha.new(1990, 5, 5), "Medicina Interna")
    @serviciouci1.asignar_paciente_a_cama(Paciente.new(1, "Juan", "Pérez", "Hombre", Fecha.new(1980, 10, 10), 1), 1, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 2), Hora.new(8, 0, 0))
    @serviciouci2.asignar_paciente_a_cama(Paciente.new(2, "Laura", "Gómez", "Mujer", Fecha.new(1990, 5, 5), 2), 2, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 1), Hora.new(8, 10, 0))
    @serviciouci2.asignar_paciente_a_cama(Paciente.new(3, "Carlos", "García", "Hombre", Fecha.new(1995, 5, 5), 3), 3, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 1), Hora.new(8, 1, 0))
    @serviciouci2.asignar_paciente_a_cama(Paciente.new(3, "Carlos", "García", "Hombre", Fecha.new(1995, 5, 5), 3), 4, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 1), Hora.new(8, 1, 0))
    @serviciouci3.asignar_paciente_a_cama(Paciente.new(3, "Carlos", "García", "Hombre", Fecha.new(1995, 5, 5), 3), 5, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 1), Hora.new(8, 20, 0))
    @serviciouci3.asignar_paciente_a_cama(Paciente.new(3, "Carlos", "García", "Hombre", Fecha.new(1995, 5, 5), 3), 6, Fecha.new(2020, 1, 1), Hora.new(8, 0, 0), Fecha.new(2020, 1, 1), Hora.new(8, 20, 0))

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
    assert_equal(3, servicio_fusionado.medicos.size)
    assert_equal(["Ana Martínez", "Juan García" ,"Pedro López"], servicio_fusionado.medicos.map(&:nombre_completo).sort)

    # Verificar camas estándar
    assert_equal(10, servicio_fusionado.camas_estandar.size)
    # evitar nil
    assert_equal(["Carlos García", "Juan Pérez", "Laura Gómez"], servicio_fusionado.camas_estandar.values.filter_map { |cama| cama[:paciente]&.nombre_completo }.sort
)


    # Verificar camas UCI
    assert_equal(8, servicio_fusionado.camas_uci_disponibles)
  end

  def test_calcular_indice_respuesta
    assert_equal ACEPTABLE, calcular_indice_respuesta(@servicio1)
    assert_equal EXCELENTE, calcular_indice_respuesta(@servicio2)
    assert_equal BUENO, calcular_indice_respuesta(@servicio3)
  end

  def test_seleccionar_servicio_con_mejor_indice
    assert_equal @servicio2, seleccionar_servicio_con_mejor_indice([@servicio1, @servicio2, @servicio3])
  end

  def test_seleccionar_servicio_con_mejor_indice_uci
    assert_equal @serviciouci2, seleccionar_servicio_con_mejor_indice_uci([@serviciouci1, @serviciouci2, @serviciouci3])
  end

end
