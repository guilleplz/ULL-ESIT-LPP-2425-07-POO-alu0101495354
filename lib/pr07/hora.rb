class Hora
  attr_reader :hora, :minuto, :segundo

  def initialize(hora, minuto, segundo)
    @hora = hora
    @minuto = minuto
    @segundo = segundo
  end

end
