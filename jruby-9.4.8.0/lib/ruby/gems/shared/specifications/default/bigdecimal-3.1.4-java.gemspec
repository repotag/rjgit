# -*- encoding: utf-8 -*-
# stub: bigdecimal 3.1.4 java lib

Gem::Specification.new do |s|
  s.name = "bigdecimal".freeze
  s.version = "3.1.4"
  s.platform = "java".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kenta Murata".freeze, "Zachary Scott".freeze, "Shigeo Kobayashi".freeze]
  s.date = "2023-09-05"
  s.description = "This library provides arbitrary-precision decimal floating-point number class.".freeze
  s.email = ["mrkn@mrkn.jp".freeze]
  s.files = ["bigdecimal.gemspec".freeze, "lib/bigdecimal.rb".freeze, "lib/bigdecimal/jacobian.rb".freeze, "lib/bigdecimal/ludcmp.rb".freeze, "lib/bigdecimal/math.rb".freeze, "lib/bigdecimal/newton.rb".freeze, "lib/bigdecimal/util.rb".freeze, "sample/linear.rb".freeze, "sample/nlsolve.rb".freeze, "sample/pi.rb".freeze]
  s.homepage = "https://github.com/ruby/bigdecimal".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Arbitrary-precision decimal floating-point number library.".freeze
end
