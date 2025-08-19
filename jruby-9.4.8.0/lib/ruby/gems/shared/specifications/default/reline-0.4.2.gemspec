# -*- encoding: utf-8 -*-
# stub: reline 0.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "reline".freeze
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["aycabta".freeze]
  s.date = "2024-01-05"
  s.description = "Alternative GNU Readline or Editline implementation by pure Ruby.".freeze
  s.email = ["aycabta@gmail.com".freeze]
  s.files = ["BSDL".freeze, "COPYING".freeze, "README.md".freeze, "lib/reline.rb".freeze, "lib/reline/ansi.rb".freeze, "lib/reline/config.rb".freeze, "lib/reline/face.rb".freeze, "lib/reline/general_io.rb".freeze, "lib/reline/history.rb".freeze, "lib/reline/key_actor.rb".freeze, "lib/reline/key_actor/base.rb".freeze, "lib/reline/key_actor/emacs.rb".freeze, "lib/reline/key_actor/vi_command.rb".freeze, "lib/reline/key_actor/vi_insert.rb".freeze, "lib/reline/key_stroke.rb".freeze, "lib/reline/kill_ring.rb".freeze, "lib/reline/line_editor.rb".freeze, "lib/reline/terminfo.rb".freeze, "lib/reline/unicode.rb".freeze, "lib/reline/unicode/east_asian_width.rb".freeze, "lib/reline/version.rb".freeze, "lib/reline/windows.rb".freeze, "license_of_rb-readline".freeze]
  s.homepage = "https://github.com/ruby/reline".freeze
  s.licenses = ["Ruby".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Alternative GNU Readline or Editline implementation by pure Ruby.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<io-console>.freeze, ["~> 0.5"])
  else
    s.add_dependency(%q<io-console>.freeze, ["~> 0.5"])
  end
end
