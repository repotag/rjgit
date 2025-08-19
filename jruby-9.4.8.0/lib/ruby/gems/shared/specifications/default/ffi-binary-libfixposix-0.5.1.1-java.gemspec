# -*- encoding: utf-8 -*-
# stub: ffi-binary-libfixposix 0.5.1.1 java lib

Gem::Specification.new do |s|
  s.name = "ffi-binary-libfixposix".freeze
  s.version = "0.5.1.1"
  s.platform = "java".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/byteit101/subspawn", "homepage_uri" => "https://github.com/byteit101/subspawn", "source_code_uri" => "https://github.com/byteit101/subspawn" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Patrick Plenefisch".freeze]
  s.date = "2023-05-20"
  s.description = "Pre-built libfixposix binaries for use with ffi-bindings-libfixposix. Part of the SubSpawn Project".freeze
  s.email = ["simonpatp@gmail.com".freeze]
  s.files = ["lib/libfixposix/binary.rb".freeze, "lib/libfixposix/binary/arm64-darwin/libfixposix.dylib".freeze, "lib/libfixposix/binary/arm64-linux/libfixposix.so".freeze, "lib/libfixposix/binary/armv6-linux/libfixposix.so".freeze, "lib/libfixposix/binary/armv7-linux/libfixposix.so".freeze, "lib/libfixposix/binary/version.rb".freeze, "lib/libfixposix/binary/x86-freebsd/libfixposix.so".freeze, "lib/libfixposix/binary/x86-linux/libfixposix.so".freeze, "lib/libfixposix/binary/x86_64-darwin/libfixposix.dylib".freeze, "lib/libfixposix/binary/x86_64-freebsd/libfixposix.so".freeze, "lib/libfixposix/binary/x86_64-linux/libfixposix.so".freeze]
  s.homepage = "https://github.com/byteit101/subspawn".freeze
  s.licenses = ["Ruby".freeze, "EPL-2.0".freeze, "LGPL-2.1-or-later".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Pre-built libfixposix binaries".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.0"])
  else
    s.add_dependency(%q<ffi>.freeze, ["~> 1.0"])
  end
end
