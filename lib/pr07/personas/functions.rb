# Variable global que mantiene el contador de personas creadas.
# Esta variable es utilizada para llevar el seguimiento de cuántas instancias de personas han sido creadas.
$numero_personas = 0

# Incrementa el contador de personas.
# Este método se llama para aumentar en uno el número total de personas cada vez que se crea una nueva instancia de Persona o sus subclases.
def incrementar_contador
  $numero_personas += 1
end

# Devuelve el número total de personas creadas.
#
# @return [Integer] El número total de personas creadas hasta el momento.
def numero_personas
  $numero_personas
end
