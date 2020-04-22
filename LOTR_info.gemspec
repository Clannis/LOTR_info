require_relative 'lib/LOTR_info/version'

Gem::Specification.new do |spec|
  spec.name          = "LOTR_info"
  spec.version       = LOTRInfo::VERSION
  spec.authors       = ["Clannis"]
  spec.email         = ["Dodds1990@gmail.com"]

  spec.summary       = "Lord of the Rings information"
  spec.description   = "Provides information about the LOTR series and location to find more infor about characters."
  spec.homepage      = "https://github.com/Clannis/LOTR_info"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]
  spec.files = ["lib/LOTR_info.rb", "lib/LOTR_info/APIManager.rb", "lib/LOTR_info/Book.rb", "lib/LOTR_info/Character.rb", "lib/LOTR_info/CLI.rb", "lib/LOTR_info/create_module.rb", "lib/LOTR_info/Movie.rb", "lib/LOTR_info/Quote.rb", "config/environment.rb"]
  spec.executables << 'LOTR_info'
end
