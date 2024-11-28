# Clase Fecha que representa una fecha del año (año, mes, dia)
class Fecha
  include Comparable
  include Enumerable

  # Accesores solo de lectura para año, mes y día
  # @return [Integer] el año, mes o día
  attr_reader :anio, :mes, :dia

  # Hash con los días máximos por mes (sin considerar los años bisiestos)
  # @return [Hash] un hash con los días máximos para cada mes del año
  DIAS_POR_MES = {
    1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
    7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31
  }

  # Constructor para inicializar un objeto de la clase Fecha
  #
  # @param anio [Integer] Año de la fecha
  # @param mes [Integer] Mes del año (1 a 12)
  # @param dia [Integer] Día del mes (1 a los días máximos del mes correspondiente)
  # @raise [ArgumentError] Si el año es menor o igual a 0
  # @raise [ArgumentError] Si el mes no está entre 1 y 12
  # @raise [ArgumentError] Si el día no está entre 1 y los días máximos del mes
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
  #
  # @param otra_fecha [Fecha] otra instancia de la clase Fecha para comparar
  # @return [Hash] un hash con la diferencia en años, meses y días
  # @example
  #   fecha1 = Fecha.new(2024, 11, 7)
  #   fecha2 = Fecha.new(2023, 11, 7)
  #   fecha1.diferencia_en_fecha(fecha2)
  #   # => { anios: 1, meses: 0, dias: 0 }
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

  def to_s
    format("%02d-%02d-%02d", @anio, @mes, @dia)
  end

  def diferencia_anios(otra_fecha)
    years = @anio - otra_fecha.anio
    years -= 1 if @mes < otra_fecha.mes || (@mes == otra_fecha.mes && @dia < otra_fecha.dia)
    years
  end

  def diferencia_dias(otra_fecha)
    if @anio == otra_fecha.anio && @mes == otra_fecha.mes
      return @dia - otra_fecha.dia
    end
    if @anio == otra_fecha.anio && @mes != otra_fecha.mes
      return DIAS_POR_MES[@mes] - otra_fecha.dia + @dia
    end
    if @anio != otra_fecha.anio
      dias = DIAS_POR_MES[@mes] - otra_fecha.dia + @dia
      (otra_fecha.mes + 1...@mes).each do |mes|
        dias += DIAS_POR_MES[mes]
      end
      dias += DIAS_POR_MES[otra_fecha.mes] - otra_fecha.dia
      dias
    end
  end

  def ==(other)
    return nil unless other.is_a?(Fecha)
    [anio, mes, dia] == [other.anio, other.mes, other.dia]
  end

  def <=>(other)
    [anio, mes, dia] <=> [other.anio, other.mes, other.dia]
  end

  def each(&block)
    [@anio, @mes, @dia].each(&block)
  end


end
