require_relative 'lib/nlbsg/version'

Gem::Specification.new do |spec|
  spec.name          = "nlbsg"
  spec.version       = NLBSG::VERSION
  spec.authors       = ["Chethan Anil"]
  spec.email         = ["chethan@anil.sg"]

  spec.summary       = %q{A ruby wrapper for the NLB SG API.}
  spec.homepage      = "https://github.com/pest-control/nlbsg"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/pest-control/nlbsg"
  spec.metadata["changelog_uri"] = "https://github.com/pest-control/nlbsg"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "savon", "~> 2.12.0"
end
