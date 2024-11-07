
# Calcula el nivel de prioridad en función de la hora de entrada
def nivel_prioridad(hora_entrada)
  hora_actual = Time.now
  diferencia = (hora_actual - hora_entrada) / 60 # diferencia en minutos

  case diferencia
  when 0..NIVEL_I
    return 'Nivel I (Azul) - Reanimación, atención inmediata'
  when NIVEL_I..NIVEL_II
    return 'Nivel II (Rojo) - Emergencia, atención en 7 minutos'
  when NIVEL_II..NIVEL_III
    return 'Nivel III (Naranja) - Urgente, atención en 30 minutos'
  when NIVEL_III..NIVEL_IV
    return 'Nivel IV (Verde) - Menos urgente, atención en 45 minutos'
  else
    return 'Nivel V (Negro) - No urgente, atención en 60 minutos'
  end
end
