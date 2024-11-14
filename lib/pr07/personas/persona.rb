require_relative './functions.rb'

class Persona
  attr_reader :id, :sexo


  def initialize(id, nombre, apellido, sexo, fecha_nacimiento)
    @id = id
    @sexo = sexo
    @fecha_nacimiento = fecha_nacimiento
    @nombre = nombre
    @apellido = apellido
    incrementar_contador
  end

  # Método público para obtener el nombre completo
  def nombre_completo
    "#{@nombre} #{@apellido}"
  end

  def edad
    fecha_actual = Fecha.new(Time.now.year, Time.now.month, Time.now.day)
    fecha_actual.diferencia_anios(@fecha_nacimiento)
  end

  def to_s
    "#{nombre_completo}, #{sexo}, #{edad} años"
  end

  def ==(otra_persona)
    return false unless otra_persona.is_a?(Persona) || otra_persona.is_a?(Medico) || otra_persona.is_a?(Titular) || otra_persona.is_a?(Paciente)

    self.id == otra_persona.id &&
    self.nombre_completo == otra_persona.nombre_completo &&
    self.sexo == otra_persona.sexo &&
    self.fecha_nacimiento == otra_persona.fecha_nacimiento
  end

  protected

  attr_reader :fecha_nacimiento

  private

  attr_reader :nombre, :apellido
end
