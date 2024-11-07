# Clase Fecha que representa una fecha del año (año, mes, dia)
class Fecha
  # Accesores solo de lectura para año, mes y día
  attr_reader :anio, :mes, :dia

  # Hash con los días máximos por mes (sin considerar los años bisiestos)
  DIAS_POR_MES = {
    1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
    7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31
  }

  # Constructor para inicializar un objeto de la clase Fecha
  def initialize(anio, mes, dia)
    # Validar que el año sea mayor que 0
    raise ArgumentError, "El año debe ser mayor que 0" unless anio > 0

    # Validar que el mes esté entre 1 y 12
    raise ArgumentError, "El mes debe estar entre 1 y 12" unless mes.between?(1, 12)

    # Validar que el día esté entre 1 y el máximo de días del mes correspondiente
    max_dia = DIAS_POR_MES[mes]
    raise ArgumentError, "El día debe estar entre 1 y #{max_dia} para el mes #{mes}" unless dia.between?(1, max_dia)

    # Asignar los valores de año, mes y día si son válidos
    @anio = anio
    @mes = mes
    @dia = dia
  end

  # Método para calcular la diferencia entre la fecha actual y otra fecha
  def diferencia_en_fecha(otra_fecha)
    # Calcular la diferencia en días, meses y años
    dia_diff = otra_fecha.dia - @dia
    mes_diff = otra_fecha.mes - @mes
    anio_diff = otra_fecha.anio - @anio

    # Ajustar la diferencia de días si es negativa
    while dia_diff < 0
      dia_diff += 30  # Asumir que cada mes tiene 30 días para simplificación
      mes_diff -= 1
    end

    # Ajustar la diferencia de meses si es negativa
    while mes_diff < 0
      mes_diff += 12
      anio_diff -= 1
    end

    # Retornar la diferencia en años, meses y días como un hash
    {
      anios: anio_diff,
      meses: mes_diff,
      dias: dia_diff
    }
  end
end
