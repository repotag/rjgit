# -*- encoding: utf-8 -*-
# stub: ffi-bindings-libfixposix 0.5.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ffi-bindings-libfixposix".freeze
  s.version = "0.5.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/byteit101/subspawn", "homepage_uri" => "https://github.com/byteit101/subspawn", "source_code_uri" => "https://github.com/byteit101/subspawn" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Patrick Plenefisch".freeze]
  s.date = "2022-11-11"
  s.description = "Direct FFI bindings for libfixposix. Binary not included.".freeze
  s.email = ["simonpatp@gmail.com".freeze]
  s.files = ["Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "lib/libfixposix.rb".freeze, "lib/libfixposix/ffi.rb".freeze, "lib/libfixposix/version.rb".freeze]
  s.homepage = "https://github.com/byteit101/subspawn".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Direct FFI bindings for libfixposix".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<ffi-binary-libfixposix>.freeze, ["~> 0.5.1"])
  else
    s.add_dependency(%q<ffi>.freeze, ["~> 1.0"])
    s.add_dependency(%q<ffi-binary-libfixposix>.freeze, ["~> 0.5.1"])
  end
end
