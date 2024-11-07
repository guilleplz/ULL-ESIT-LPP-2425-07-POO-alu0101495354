# Calcula el nivel de prioridad en función de la hora de entrada
def nivel_prioridad(hora_entrada)
  # Obtener la hora actual
  hora_actual = Time.now

  # Calcular la diferencia en minutos entre la hora actual y la hora de entrada
  diferencia = (hora_actual - hora_entrada) / 60 # diferencia en minutos

  # Evaluar la diferencia y asignar un nivel de prioridad en función de los rangos definidos
  case diferencia
  when 0..NIVEL_I
    # Si la diferencia está dentro del rango del Nivel I (atención inmediata)
    return 'Nivel I (Azul) - Reanimación, atención inmediata'
  when NIVEL_I..NIVEL_II
    # Si la diferencia está dentro del rango del Nivel II (atención en 7 minutos)
    return 'Nivel II (Rojo) - Emergencia, atención en 7 minutos'
  when NIVEL_II..NIVEL_III
    # Si la diferencia está dentro del rango del Nivel III (atención en 30 minutos)
    return 'Nivel III (Naranja) - Urgente, atención en 30 minutos'
  when NIVEL_III..NIVEL_IV
    # Si la diferencia está dentro del rango del Nivel IV (atención en 45 minutos)
    return 'Nivel IV (Verde) - Menos urgente, atención en 45 minutos'
  else
    # Si la diferencia es mayor que el rango del Nivel IV, se considera el Nivel V (atención en 60 minutos)
    return 'Nivel V (Negro) - No urgente, atención en 60 minutos'
  end
end
