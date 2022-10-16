Gem::Specification.new do |spec|
  spec.name = "taggl"
  spec.version = File.read("VERSION").strip
  spec.authors = ["Francesco Belladonna"]
  spec.email = ["francesco@fc5.me"]

  spec.summary = "Tag query language with parsing and filtering capabilities"
  spec.description = "Tag query language with parsing and filtering capabilities"
  spec.homepage = "https://github.com/Fire-Dragon-DoL/taggl"
  spec.required_ruby_version = ">= 2.7.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "test_bench"
  spec.add_development_dependency "tty-table"
end
