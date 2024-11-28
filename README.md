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


## Clase Paciente

### Descripción
La clase `Paciente` representa a un paciente dentro del sistema sanitario. Hereda de la clase `Persona` y encapsula las propiedades específicas de un paciente, como su prioridad en el triaje y su conjunto de diagnósticos.

### Atributos
- **Prioridad (nivel de triaje)**: Un valor que indica el nivel de urgencia del paciente según el sistema de triaje (Azul, Rojo, Naranja, Verde, Negro).
- **Diagnósticos**: Un conjunto de diagnósticos médicos que el paciente ha recibido. Pueden ser: `alta`, `leve`, `grave`, `muy grave`.

### Métodos
- **`prioridad`**: Accede al nivel de prioridad del paciente.
- **`diagnosticos`**: Accede a la lista de diagnósticos del paciente.
- **`ultimo_diagnostico`**: Devuelve el último diagnóstico asignado al paciente.
- **`to_s`**: Método de conversión a cadena que representa al paciente con su nombre completo y su prioridad.
  
### Herencia
La clase `Paciente` hereda de la clase `Persona`, lo que significa que tiene todos los atributos y métodos de la clase `Persona`, incluyendo los métodos de acceso a nombre completo, sexo, y edad.

### Métodos adicionales
- **`edad`**: Calcula la edad del paciente en años utilizando la clase `Fecha`.

## Clase Medico

### Descripción
La clase `Medico` representa a un médico dentro del sistema sanitario. Hereda de la clase `Persona` y encapsula las propiedades específicas de un médico, como su especialidad y el conjunto de pacientes asignados.

### Atributos
- **Especialidad**: Una cadena que representa la especialidad del médico. Las especialidades posibles son: `general`, `geriatría`, `pediatría`.
- **Pacientes asignados**: Un conjunto de pacientes asignados al médico.

### Métodos
- **`especialidad`**: Accede a la especialidad del médico.
- **`pacientes`**: Accede a la lista de pacientes asignados al médico.
- **`numero_pacientes`**: Devuelve el número de pacientes asignados al médico.
- **`to_s`**: Método de conversión a cadena que representa al médico con su nombre completo, especialidad y número de pacientes asignados.
  
### Herencia
La clase `Medico` hereda de la clase `Persona`, lo que significa que tiene todos los atributos y métodos de la clase `Persona`, como el nombre completo, sexo y edad.

### Métodos adicionales
- **`edad`**: Calcula la edad del médico en años utilizando la clase `Fecha`.


## Clase `Titular`

La clase `Titular` representa a un médico titular, un tipo especializado de `Medico`, con la particularidad de que no puede manejar más de un número máximo de pacientes asignados, que puede variar según el médico. 

### Propiedades

- **`@max_pacientes`**: Atributo entero que almacena el número máximo de pacientes que un médico titular puede atender simultáneamente.
- **`@pacientes`**: Atributo que almacena una lista de pacientes asignados al médico titular. Esta lista se llena con instancias de la clase `Paciente`.

### Métodos

#### `initialize(id, nombre, apellido, sexo, fecha_nacimiento, especialidad, max_pacientes)`
Este es el constructor de la clase. Inicializa un médico titular con los siguientes parámetros:
- `id`: Identificador único de la persona.
- `nombre`: Nombre del médico.
- `apellido`: Apellido del médico.
- `sexo`: Sexo del médico.
- `fecha_nacimiento`: Fecha de nacimiento del médico.
- `especialidad`: Especialidad médica del médico titular.
- `max_pacientes`: Número máximo de pacientes que el médico puede atender simultáneamente.

#### `max_pacientes`
Método getter que devuelve el número máximo de pacientes que el médico titular puede atender.

#### `numero_pacientes`
Método getter que devuelve el número de pacientes actualmente asignados al médico titular.

#### `ha_alcanzado_carga_maxima?`
Método que devuelve un valor booleano indicando si el médico titular ha alcanzado el número máximo de pacientes asignados. Devuelve `true` si ha alcanzado el límite, de lo contrario `false`.

#### `to_s`
Método que devuelve una representación en cadena de caracteres del objeto, que incluye el nombre completo del médico y su especialidad.

## Clase ServicioSalud

### Descripción

La clase `ServicioSalud` representa un servicio de salud dentro del sistema sanitario. Gestiona los médicos, pacientes y otros servicios relacionados con la atención médica.

### Atributos
- **`@medicos`**: Una lista de médicos disponibles en el servicio.
- **`@pacientes`**: Una lista de pacientes registrados en el servicio.
- **`@nombre`**: Nombre del servicio de salud.

### Métodos
- **`initialize(nombre)`**: Constructor que inicializa el nombre del servicio de salud.
- **`agregar_medico(medico)`**: Añade un médico al servicio de salud.
- **`agregar_paciente(paciente)`**: Añade un paciente al servicio de salud.
- **`obtener_medicos`**: Devuelve la lista de médicos asignados al servicio.
- **`obtener_pacientes`**: Devuelve la lista de pacientes registrados en el servicio.
- **`to_s`**: Método de conversión a cadena que representa el servicio de salud con su nombre y número de médicos y pacientes.

## Clase ServicioUrgencias

### Descripción

La clase `ServicioUrgencias` es una subclase de `ServicioSalud` que maneja específicamente los casos de urgencias médicas. Está encargada de gestionar los pacientes con niveles de urgencia más altos, asignando médicos según su especialidad y número de pacientes.

### Atributos
- **`@pacientes_urgentes`**: Lista de pacientes con urgencia de atención médica.
- **`@medicos_urgencias`**: Lista de médicos especializados en urgencias.

### Métodos
- **`initialize(nombre)`**: Constructor que inicializa el nombre del servicio de urgencias.
- **`agregar_paciente_urgente(paciente)`**: Añade un paciente a la lista de urgencias, priorizando los casos más graves.
- **`asignar_medico_a_urgencia(medico)`**: Asigna un médico especializado en urgencias a la lista de médicos de urgencias.
- **`to_s`**: Método de conversión a cadena que representa el servicio de urgencias, incluyendo el nombre, médicos y pacientes.

## Clase ServicioHospitalizacion

### Descripción

La clase `ServicioHospitalizacion` representa un servicio de hospitalización, que se encarga de gestionar a los pacientes que requieren una estancia prolongada en el hospital para recibir tratamiento.

### Atributos
- **`@pacientes_hospitalizados`**: Lista de pacientes hospitalizados.
- **`@medicos_hospitalizacion`**: Lista de médicos asignados a los pacientes hospitalizados.

### Métodos
- **`initialize(nombre)`**: Constructor que inicializa el nombre del servicio de hospitalización.
- **`agregar_paciente_hospitalizado(paciente)`**: Añade un paciente a la lista de hospitalizados.
- **`asignar_medico_a_hospitalizacion(medico)`**: Asigna un médico a los pacientes hospitalizados.
- **`to_s`**: Método de conversión a cadena que representa el servicio de hospitalización, incluyendo el nombre, médicos y pacientes hospitalizados.