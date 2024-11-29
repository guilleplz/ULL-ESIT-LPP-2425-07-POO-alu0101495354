# Clase Fecha que representa una fecha específica (año, mes, día).
#
# Esta clase permite representar fechas y realizar varias operaciones con ellas, como calcular la
# diferencia entre dos fechas, comparar fechas y formatearlas en una cadena.
#
# La clase incluye funcionalidades como la comparación de fechas y la enumeración de sus componentes.
class Fecha
  include Comparable
  include Enumerable

  # Accesores solo de lectura para año, mes y día
  # @return [Integer] El año, mes o día de la fecha
  attr_reader :anio, :mes, :dia

  # Hash que define los días máximos de cada mes del año (sin considerar los años bisiestos).
  #
  # @return [Hash] Un hash con los días máximos de cada mes del año.
  DIAS_POR_MES = {
    1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
    7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31
  }

  # Constructor que inicializa una instancia de la clase Fecha.
  #
  # @param anio [Integer] El año de la fecha (debe ser mayor que 0).
  # @param mes [Integer] El mes de la fecha (debe estar entre 1 y 12).
  # @param dia [Integer] El día de la fecha (debe estar entre 1 y los días máximos del mes).
  # @raise [ArgumentError] Si el año es menor o igual a 0.
  # @raise [ArgumentError] Si el mes no está entre 1 y 12.
  # @raise [ArgumentError] Si el día no está entre 1 y los días máximos del mes.
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

  # Método que calcula la diferencia entre la fecha actual y otra fecha.
  #
  # Calcula la diferencia en años, meses y días entre la fecha actual y una fecha pasada como parámetro.
  #
  # @param otra_fecha [Fecha] La otra instancia de la clase Fecha para comparar.
  # @return [Hash] Un hash con la diferencia en años, meses y días.
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

  # Representa la fecha en formato de cadena (dd-mm-aaaa).
  #
  # @return [String] La fecha formateada como "dd-mm-aaaa".
  def to_s
    format("%02d-%02d-%02d", @anio, @mes, @dia)
  end

  # Calcula la diferencia en años entre la fecha actual y otra fecha.
  #
  # @param otra_fecha [Fecha] La otra fecha con la que se calculará la diferencia.
  # @return [Integer] La diferencia en años.
  def diferencia_anios(otra_fecha)
    years = @anio - otra_fecha.anio
    years -= 1 if @mes < otra_fecha.mes || (@mes == otra_fecha.mes && @dia < otra_fecha.dia)
    years
  end

  # Calcula la diferencia en días entre la fecha actual y otra fecha.
  #
  # Este método calcula la diferencia en días entre las dos fechas, considerando el número de días
  # en cada mes, pero sin tener en cuenta años bisiestos ni ajustes de días específicos por mes.
  #
  # @param otra_fecha [Fecha] La otra fecha para la cual se calculará la diferencia en días.
  # @return [Integer] La diferencia en días entre las dos fechas.
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

  # Compara si dos fechas son iguales.
  #
  # @param other [Object] La otra fecha a comparar.
  # @return [Boolean] true si las fechas son iguales, false si no lo son.
  def ==(other)
    return nil unless other.is_a?(Fecha)
    [anio, mes, dia] == [other.anio, other.mes, other.dia]
  end

  # Compara dos fechas y devuelve el orden relativo.
  #
  # @param other [Fecha] La otra fecha con la que comparar.
  # @return [Integer] -1 si la fecha actual es menor, 0 si son iguales, 1 si la fecha actual es mayor.
  def <=>(other)
    [anio, mes, dia] <=> [other.anio, other.mes, other.dia]
  end

  # Itera sobre los componentes de la fecha (año, mes, día) y los pasa a un bloque.
  #
  # @yield [anio, mes, dia] Cada uno de los componentes de la fecha.
  def each(&block)
    [@anio, @mes, @dia].each(&block)
  end
end
