require_relative './functions.rb'

class Persona
  attr_reader :id, :sexo


  def initialize(id, nombre, apellido, sexo, fecha_nacimiento)
    @id = id
    @sexo = sexo
    @fecha_nacimiento = fecha_nacimiento
    @nombre = nombre
    @apellido = apellido
    if self.class == Persona  # Solo incrementa el contador si la clase es exactamente Persona
      incrementar_contador
    end
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

  protected

  attr_reader :fecha_nacimiento

  private

  attr_reader :nombre, :apellido
end
