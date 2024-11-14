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


## Clase Hora


### Descripción

La clase `Hora` representa una hora con atributos de **hora**, **minuto** y **segundo**, asegurando que los valores sean válidos. Permite calcular la diferencia entre dos instancias de `Hora`.

### Atributos

- **`@hora`**: Hora entre 0 y 23.
- **`@minuto`**: Minuto entre 0 y 59.
- **`@segundo`**: Segundo entre 0 y 59.

### Métodos

- **`initialize(hora, minuto, segundo)`**: Constructor que valida los valores de hora, minuto y segundo.
- **`diferencia_en_tiempo(otra_hora)`**: Calcula la diferencia entre dos instancias de `Hora` y devuelve un hash con las diferencias en horas, minutos y segundos.

#### Validación de Límites

- La hora debe estar entre 0 y 23.
- Los minutos y segundos deben estar entre 0 y 59.
- Si algún valor es inválido, se lanza un `ArgumentError`.

## Clase Fecha

### Descripción

La clase `Fecha` representa una fecha con los atributos **año**, **mes** y **día**. Asegura que los valores sean válidos y permite calcular la diferencia entre dos fechas.

### Atributos

- **`@año`**: Año de la fecha, debe ser un número entero positivo.
- **`@mes`**: Mes de la fecha, debe estar entre 1 y 12.
- **`@dia`**: Día de la fecha, debe estar entre 1 y 31.

### Métodos

- **`initialize(año, mes, dia)`**: Constructor que valida los valores de año, mes y día.
- **`diferencia_en_fechas(otra_fecha)`**: Calcula la diferencia entre dos instancias de `Fecha` y devuelve un hash con la diferencia en años, meses y días.

#### Validación de Límites

- El año debe ser mayor o igual a 0.
- El mes debe estar entre 1 y 12.
- El día debe estar entre 1 y 31.
- Si algún valor es inválido, se lanza un `ArgumentError`.


## Clase Persona

### Descripción General

La clase `Persona` representa a una persona con atributos básicos y encapsula propiedades comunes a distintas entidades (como médicos o pacientes). Incluye métodos para acceder a sus datos de manera controlada y para calcular la edad de la persona basada en su fecha de nacimiento.

### Atributos

- `@id` (público): Identificación única de la persona.
- `@sexo` (público): Género de la persona.
- `@fecha_nacimiento` (protegido): Fecha de nacimiento, utilizada para calcular la edad.
- `@nombre` y `@apellido` (privados): Nombre y apellido de la persona, accesibles únicamente a través del método `nombre_completo`.

### Métodos

- `initialize(id, nombre, apellido, sexo, fecha_nacimiento)`: Constructor que inicializa los atributos de la persona. Al crear una instancia, aumenta el contador de personas instanciadas.
- `self.numero_personas`: Método de clase que devuelve el número de personas instanciadas.
- `nombre_completo`: Método que retorna el nombre completo de la persona como una cadena de texto.
- `edad`: Calcula y retorna la edad de la persona en años, utilizando el método `diferencia_anios` de la clase `Fecha`.
- `to_s`: Convierte la información de la persona en una cadena de texto, incluyendo nombre completo, sexo y edad.

### Visibilidad de Atributos

- `@fecha_nacimiento`: Atributo protegido, accesible solo dentro de la clase y sus subclases.
- `@nombre` y `@apellido`: Atributos privados, solo accesibles dentro de la clase `Persona`.
