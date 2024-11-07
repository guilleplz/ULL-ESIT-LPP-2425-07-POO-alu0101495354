require_relative 'lib/pr07/version'

Gem::Specification.new do |spec|
  spec.name          = "pr07"
  spec.version       = Pr07::VERSION
  spec.authors       = ["Guillermo Plaza"]
  spec.email         = ["alu0101495354@ull.edu.es"]

  spec.summary       = %q{Esta gema representa un proceso que permite la gestión de riesgos clínicos basado en el concepto de triaje}
  spec.homepage      = "https://github.com/guilleplz/ULL-ESIT-LPP-2425-06-POO-alu0101495354"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/guilleplz/ULL-ESIT-LPP-2425-06-POO-alu0101495354"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/guilleplz/ULL-ESIT-LPP-2425-06-POO-alu0101495354"
  spec.metadata["changelog_uri"] = "https://github.com/guilleplz/ULL-ESIT-LPP-2425-06-POO-alu0101495354"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
