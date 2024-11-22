# Clase que representa a un médico, heredando de la clase Persona.
# Un médico tiene una especialidad y una lista de pacientes.
class Medico < Persona

  include Comparable
  include Enumerable

  # Atributos de lectura para acceder a la especialidad y la lista de pacientes.
  attr_reader :especialidad, :pacientes

  # Inicializa un nuevo objeto Medico.
  #
  # @param id [String] El ID único del médico.
  # @param nombre [String] El nombre del médico.
  # @param apellido [String] El apellido del médico.
  # @param sexo [String] El sexo del médico.
  # @param fecha_nacimiento [Date] La fecha de nacimiento del médico.
  # @param especialidad [String] La especialidad médica del médico.
  def initialize(id, nombre, apellido, sexo, fecha_nacimiento, especialidad)
    super(id, nombre, apellido, sexo, fecha_nacimiento)
    @especialidad = especialidad
    @pacientes = []
  end

  # Agrega un paciente a la lista de pacientes del médico.
  #
  # @param paciente [Paciente] Un objeto paciente que se añadirá a la lista.
  def agregar_paciente(paciente)
    @pacientes << paciente
  end

  # Devuelve el número de pacientes asignados al médico.
  #
  # @return [Integer] El número total de pacientes.
  def numero_pacientes
    @pacientes.size
  end

  def ==(other)
    return nil unless other.is_a?(Medico)
    self.numero_pacientes == other.numero_pacientes
  end

  def <=>(other)
    return nil unless other.is_a?(Medico)
    self.numero_pacientes <=> other.numero_pacientes
  end

  def each
    @pacientes.each { |paciente| yield paciente }
  end


end
