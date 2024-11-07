# Pr07
 

## Clase NivelTriaje

### Descripción General

La clase `NivelTriaje` representa un nivel dentro del Sistema Español de Triaje (SET). Este sistema se utiliza para priorizar la atención de pacientes según la gravedad y urgencia de su estado. La clase permite crear objetos que definen el nivel de prioridad en el triaje, basados en categorías predefinidas: Reanimación, Emergencia, Urgente, Menos urgente y No urgente.

### Propósito de la Clase

El propósito principal de `NivelTriaje` es clasificar los niveles de atención según los colores y tiempos de respuesta asociados a cada prioridad en el SET. La clase es útil en sistemas que requieren gestionar flujos de pacientes, permitiendo asignar rápidamente el nivel de urgencia correspondiente a cada caso.

### Atributos

#### `@nivel`

- **Tipo**: Integer
- **Descripción**: Representa el nivel de triaje, que puede ser un valor entre 1 y 5. Cada valor corresponde a una categoría específica:
  - `1`: Reanimación (Inmediato)
  - `2`: Emergencia (7 minutos)
  - `3`: Urgente (30 minutos)
  - `4`: Menos urgente (45 minutos)
  - `5`: No urgente (60 minutos)

### Métodos

#### `initialize(nivel)`

- **Parámetro**: `nivel` (Integer) - El nivel de triaje deseado al crear un nuevo objeto `NivelTriaje`.
- **Descripción**: Inicializa una nueva instancia de `NivelTriaje` con el nivel especificado. Asigna este valor al atributo `@nivel`.

#### `nivel_prioridad`

- **Descripción**: Retorna la categoría de prioridad en forma de cadena de texto, basándose en el nivel numérico de la instancia.
- **Retorno**: `String` - La categoría correspondiente al nivel de triaje.
  - Ejemplos de valores retornados: `"Reanimación"`, `"Emergencia"`, `"Urgente"`, `"Menos urgente"`, `"No urgente"`.
