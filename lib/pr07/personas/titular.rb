# Clase que representa a un titular, que es un tipo especializado de médico.
# Un titular tiene un número máximo de pacientes que puede atender.
class Titular < Medico

  include Comparable
  
  # Atributo de lectura para acceder al número máximo de pacientes.
  attr_reader :max_pacientes

  # Inicializa un nuevo objeto Titular.
  #
  # @param id [String] El ID único del titular.
  # @param nombre [String] El nombre del titular.
  # @param apellido [String] El apellido del titular.
  # @param sexo [String] El sexo del titular.
  # @param fecha_nacimiento [Date] La fecha de nacimiento del titular.
  # @param especialidad [String] La especialidad médica del titular.
  # @param max_pacientes [Integer] El número máximo de pacientes que el titular puede atender.
  def initialize(id, nombre, apellido, sexo, fecha_nacimiento, especialidad, max_pacientes)
    super(id, nombre, apellido, sexo, fecha_nacimiento, especialidad)
    @max_pacientes = max_pacientes
  end

  # Verifica si el titular ha alcanzado su carga máxima de pacientes.
  #
  # @return [Boolean] true si el titular ha alcanzado o superado el número máximo de pacientes,
  #                   false si no lo ha alcanzado.
  def carga_maxima?
    @pacientes.size >= @max_pacientes
  end

  def <=>(other)
    return nil unless other.is_a?(Titular)
    self.max_pacientes <=> other.max_pacientes
  end

end
