# -*- encoding: utf-8 -*-
# stub: subspawn-posix 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "subspawn-posix".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/byteit101/subspawn", "homepage_uri" => "https://github.com/byteit101/subspawn", "source_code_uri" => "https://github.com/byteit101/subspawn" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Patrick Plenefisch".freeze]
  s.date = "2022-11-22"
  s.description = "A SubSpawn subproject to wrap libfixposix as a mid level API".freeze
  s.email = ["simonpatp@gmail.com".freeze]
  s.files = [".rspec".freeze, "Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "lib/subspawn/binary.rb".freeze, "lib/subspawn/posix.rb".freeze, "lib/subspawn/posix/ffi_helper.rb".freeze, "lib/subspawn/posix/pty.rb".freeze, "lib/subspawn/posix/signals.rb".freeze, "lib/subspawn/posix/version.rb".freeze, "sig/subspawn/posix.rbs".freeze]
  s.homepage = "https://github.com/byteit101/subspawn".freeze
  s.licenses = ["Ruby".freeze, "EPL-2.0".freeze, "LGPL-2.1-or-later".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "SubSpawn Mid-level API for POSIX systems".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ffi-bindings-libfixposix>.freeze, ["~> 0.5.0"])
  else
    s.add_dependency(%q<ffi-bindings-libfixposix>.freeze, ["~> 0.5.0"])
  end
end
