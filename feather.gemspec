# frozen_string_literal: true

require_relative "lib/feather/version"

Gem::Specification.new do |spec|
  spec.name = "feather"
  spec.version = Feather::VERSION
  spec.authors = ["Stephen Margheim"]
  spec.email = ["stephen.margheim@gmail.com"]

  spec.summary = "Ruby library for working with SQLite elegantly"
  spec.homepage = "https://github.com/fractaledmind/feather"
  spec.license = "Copyright Joel Drapper and Stephen Margheim"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "zeitwerk"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
