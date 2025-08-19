# -*- encoding: utf-8 -*-
# stub: nkf 0.2.0 java lib

Gem::Specification.new do |s|
  s.name = "nkf".freeze
  s.version = "0.2.0"
  s.platform = "java".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/ruby/nkf", "source_code_uri" => "https://github.com/ruby/nkf" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["NARUSE Yui".freeze, "Charles Oliver Nutter".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-01-22"
  s.description = "Ruby extension for Network Kanji Filter".freeze
  s.email = ["naruse@airemix.jp".freeze, "headius@headius.com".freeze]
  s.files = [".git-blame-ignore-revs".freeze, ".github/dependabot.yml".freeze, ".github/workflows/test.yml".freeze, ".gitignore".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "bin/console".freeze, "bin/setup".freeze, "ext/java/org/jruby/ext/nkf/Command.java".freeze, "ext/java/org/jruby/ext/nkf/CommandParser.java".freeze, "ext/java/org/jruby/ext/nkf/NKFLibrary.java".freeze, "ext/java/org/jruby/ext/nkf/Option.java".freeze, "ext/java/org/jruby/ext/nkf/Options.java".freeze, "ext/java/org/jruby/ext/nkf/RubyNKF.java".freeze, "ext/nkf/extconf.rb".freeze, "ext/nkf/nkf-utf8/config.h".freeze, "ext/nkf/nkf-utf8/nkf.c".freeze, "ext/nkf/nkf-utf8/nkf.h".freeze, "ext/nkf/nkf-utf8/utf8tbl.c".freeze, "ext/nkf/nkf-utf8/utf8tbl.h".freeze, "ext/nkf/nkf.c".freeze, "lib/kconv.rb".freeze, "lib/nkf.jar".freeze, "lib/nkf.rb".freeze, "nkf.gemspec".freeze]
  s.homepage = "https://github.com/ruby/nkf".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze, "EPL-2.0".freeze, "LGPL-2.1".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Ruby extension for Network Kanji Filter".freeze
end
