class Titular < Medico
  attr_reader :max_pacientes

  def initialize(id, nombre, apellido, sexo, fecha_nacimiento, especialidad, max_pacientes)
    super(id, nombre, apellido, sexo, fecha_nacimiento, especialidad)
    @max_pacientes = max_pacientes
  end

  def carga_maxima?
    @pacientes.size >= @max_pacientes
  end
end
