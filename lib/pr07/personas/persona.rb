# Clase que representa a una persona.
# Esta clase es la clase base para otros tipos de personas, como Medico, Titular y Paciente.
class Persona
  # Atributos de lectura para acceder al ID y sexo de la persona.
  attr_reader :id, :sexo

  # Inicializa un nuevo objeto Persona.
  #
  # @param id [String] El ID único de la persona.
  # @param nombre [String] El nombre de la persona.
  # @param apellido [String] El apellido de la persona.
  # @param sexo [String] El sexo de la persona.
  # @param fecha_nacimiento [Fecha] La fecha de nacimiento de la persona.
  def initialize(id, nombre, apellido, sexo, fecha_nacimiento)
    @id = id
    @sexo = sexo
    @fecha_nacimiento = fecha_nacimiento
    @nombre = nombre
    @apellido = apellido
    incrementar_contador
  end

  # Devuelve el nombre completo de la persona (nombre y apellido).
  #
  # @return [String] El nombre completo de la persona.
  def nombre_completo
    "#{@nombre} #{@apellido}"
  end

  # Calcula la edad de la persona basado en la fecha de nacimiento.
  #
  # @return [Integer] La edad de la persona en años.
  def edad
    fecha_actual = Fecha.new(Time.now.year, Time.now.month, Time.now.day)
    fecha_actual.diferencia_anios(@fecha_nacimiento)
  end

  # Representación en forma de cadena de la persona, con su nombre completo, sexo y edad.
  #
  # @return [String] La representación en cadena de la persona.
  def to_s
    "#{nombre_completo}, #{sexo}, #{edad} años"
  end

  # Método para comparar dos personas.
  #
  # @param otra_persona [Persona, Medico, Titular, Paciente] La persona a comparar.
  # @return [Boolean] true si ambas personas son iguales, false si no lo son.
  def ==(otra_persona)
    return false unless otra_persona.is_a?(Persona) || otra_persona.is_a?(Medico) || otra_persona.is_a?(Titular) || otra_persona.is_a?(Paciente)

    self.id == otra_persona.id &&
    self.nombre_completo == otra_persona.nombre_completo &&
    self.sexo == otra_persona.sexo &&
    self.fecha_nacimiento == otra_persona.fecha_nacimiento
  end

  protected

  # Atributo de lectura para acceder a la fecha de nacimiento.
  attr_reader :fecha_nacimiento

  private

  # Atributos privados para acceder al nombre y apellido.
  attr_reader :nombre, :apellido
end
