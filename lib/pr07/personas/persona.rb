require_relative '../fecha'

class Persona
  attr_reader :id, :sexo

  @@personas_instanciadas = -1

  def initialize(id, nombre, apellido, sexo, fecha_nacimiento)
    @id = id
    @sexo = sexo
    @fecha_nacimiento = fecha_nacimiento
    @nombre = nombre
    @apellido = apellido
    @@personas_instanciadas += 1
  end

  def self.numero_personas
    @@personas_instanciadas
  end

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

  protected

  attr_reader :fecha_nacimiento

  private

  attr_reader :nombre, :apellido
end
