class Fecha
  attr_reader :anio, :mes, :dia

  # Los días máximos por cada mes (sin tener en cuenta los años bisiestos)
  DIAS_POR_MES = {
    1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
    7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31
  }

  def initialize(anio, mes, dia)
    # Validar el año (debe ser mayor que 0)
    raise ArgumentError, "El año debe ser mayor que 0" unless anio > 0

    # Validar el mes (debe estar entre 1 y 12)
    raise ArgumentError, "El mes debe estar entre 1 y 12" unless mes.between?(1, 12)

    # Validar el día (debe estar entre 1 y el máximo de días del mes)
    max_dia = DIAS_POR_MES[mes]
    raise ArgumentError, "El día debe estar entre 1 y #{max_dia} para el mes #{mes}" unless dia.between?(1, max_dia)

    # Asignar los valores de fecha si son válidos
    @anio = anio
    @mes = mes
    @dia = dia
  end

  def diferencia_en_fecha(otra_fecha)
    dia_diff = otra_fecha.dia - @dia
    mes_diff = otra_fecha.mes - @mes
    anio_diff = otra_fecha.anio - @anio

    while dia_diff < 0
      dia_diff += 30
      mes_diff -= 1
    end

    while mes_diff < 0
      mes_diff += 12
      anio_diff -= 1
    end

    {
      anios: anio_diff,
      meses: mes_diff,
      dias: dia_diff
    }
  end
end
