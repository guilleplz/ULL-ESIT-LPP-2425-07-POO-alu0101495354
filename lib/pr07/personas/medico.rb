# Clase que representa a un paciente, heredando de la clase Persona.
# Un paciente tiene una prioridad y una lista de diagnósticos.
class Paciente < Persona
  # Atributos de lectura para acceder a la prioridad y la lista de diagnósticos.
  attr_reader :prioridad, :diagnosticos

  # Inicializa un nuevo objeto Paciente.
  #
  # @param id [String] El ID único del paciente.
  # @param nombre [String] El nombre del paciente.
  # @param apellido [String] El apellido del paciente.
  # @param sexo [String] El sexo del paciente.
  # @param fecha_nacimiento [Date] La fecha de nacimiento del paciente.
  # @param prioridad [Integer] La prioridad asignada al paciente.
  def initialize(id, nombre, apellido, sexo, fecha_nacimiento, prioridad)
    # No llamamos a super aquí para evitar incrementar el contador dos veces
    super(id, nombre, apellido, sexo, fecha_nacimiento)  # Esto invoca el constructor de Persona
    @prioridad = prioridad
    @diagnosticos = []
  end

  # Agrega un diagnóstico a la lista de diagnósticos del paciente.
  #
  # @param diagnostico [String] El diagnóstico que se añadirá a la lista.
  def agregar_diagnostico(diagnostico)
    @diagnosticos << diagnostico
  end

  # Devuelve el último diagnóstico asignado al paciente.
  #
  # @return [String, nil] El último diagnóstico o nil si no hay diagnósticos.
  def ultimo_diagnostico
    @diagnosticos.last
  end
end
