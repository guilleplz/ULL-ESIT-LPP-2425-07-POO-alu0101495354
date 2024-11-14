require_relative "pr07/version"
require_relative "pr07/nivel_triaje"
require_relative "pr07/constants"
require_relative "pr07/hora"
require_relative "pr07/fecha"
require_relative "pr07/functions"
require_relative "pr07/personas/persona"
require_relative "pr07/personas/paciente"
require_relative "pr07/personas/functions"
require_relative "pr07/personas/medico"
require_relative "pr07/personas/titular"

module Pr07
  class Error < StandardError; end
end
