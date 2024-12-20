require_relative 'servicio_salud/servicio_salud'
require_relative 'servicio_salud/servicio_urgencias'
require_relative 'servicio_salud/servicio_hospitalizacion'

class ServicioSaludDSL
  def initialize(&block)
    @proveedores = []
    @solicitados = []

    instance_eval(&block) if block_given?
  end

  def registrar_servicio(tipo_servicio, codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos, numero_camas, camas_uci_disponibles = nil, numero_plantas = nil)
    proveedor = case tipo_servicio
                when 'servicio_salud'
                  servicio = ServicioSalud.new(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos, numero_camas)
                  servicio
                when 'servicio_urgencias'
                  servicio = ServicioUrgencias.new(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos, numero_camas, camas_uci_disponibles)
                  servicio
                when 'servicio_hospitalizacion'
                  servicio = ServicioHospitalizacion.new(codigo_identificacion, descripcion, horario_apertura, horario_cierre, calendario_festivos, numero_camas, numero_plantas)
                  servicio
                else
                  raise ArgumentError, "Tipo de servicio desconocido: #{tipo_servicio}"
                end
    @proveedores << proveedor
  end


  def solicitar_servicio(codigo_servicio, id, nombre, apellido, sexo, fecha_nacimiento, prioridad)
    solicitante = Paciente.new(id, nombre, apellido, sexo, fecha_nacimiento, prioridad)
    @solicitados << {servicio: codigo_servicio, paciente: solicitante}
  end

  def status
    puts "Estado del sistema sanitario:"
    @proveedores.each do |proveedor|
      puts "Proveedor: #{proveedor}"
      @solicitados.each do |solicitado|
        if solicitado[:servicio] == proveedor.codigo_identificacion
          puts "  Paciente: #{solicitado[:paciente]}"
        end
      end
    end
  end
end
