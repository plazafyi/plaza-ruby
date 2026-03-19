# frozen_string_literal: true

require_relative "lib/plaza/version"

Gem::Specification.new do |s|
  s.name = "plaza"
  s.version = Plaza::VERSION
  s.summary = "Ruby library to access the Plaza API"
  s.authors = ["Plaza"]
  s.email = "support@plaza.fyi"
  s.homepage = "https://gemdocs.org/gems/plaza"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/plazafyi/plaza-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
end
