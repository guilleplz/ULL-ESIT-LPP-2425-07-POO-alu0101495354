class Paciente < Persona
  attr_reader :prioridad, :diagnosticos

  def initialize(id, nombre, apellido, sexo, fecha_nacimiento, prioridad)
    # No llamamos a super aquí para evitar incrementar el contador dos veces
    super(id, nombre, apellido, sexo, fecha_nacimiento)  # Esto invoca el constructor de Persona
    @prioridad = prioridad
    @diagnosticos = []
  end

  def agregar_diagnostico(diagnostico)
    @diagnosticos << diagnostico
  end

  def ultimo_diagnostico
    @diagnosticos.last
  end
end
