class Medico < Persona
  attr_reader :especialidad, :pacientes

  def initialize(id, nombre, apellido, sexo, fecha_nacimiento, especialidad)
    super(id, nombre, apellido, sexo, fecha_nacimiento)
    @especialidad = especialidad
    @pacientes = []
  end

  def agregar_paciente(paciente)
    @pacientes << paciente
  end

  def numero_pacientes
    @pacientes.size
  end
end
