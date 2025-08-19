# -*- encoding: utf-8 -*-
# stub: json 2.7.1 java lib

Gem::Specification.new do |s|
  s.name = "json".freeze
  s.version = "2.7.1"
  s.platform = "java".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/flori/json/issues", "changelog_uri" => "https://github.com/flori/json/blob/master/CHANGES.md", "documentation_uri" => "https://flori.github.io/json/doc/index.html", "homepage_uri" => "https://flori.github.io/json", "source_code_uri" => "https://github.com/flori/json", "wiki_uri" => "https://github.com/flori/json/wiki" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Luz".freeze]
  s.date = "2023-12-05"
  s.description = "A JSON implementation as a JRuby extension.".freeze
  s.email = "dev+ruby@mernen.com".freeze
  s.files = ["LICENSE".freeze, "lib/json.rb".freeze, "lib/json/add/bigdecimal.rb".freeze, "lib/json/add/complex.rb".freeze, "lib/json/add/core.rb".freeze, "lib/json/add/date.rb".freeze, "lib/json/add/date_time.rb".freeze, "lib/json/add/exception.rb".freeze, "lib/json/add/ostruct.rb".freeze, "lib/json/add/range.rb".freeze, "lib/json/add/rational.rb".freeze, "lib/json/add/regexp.rb".freeze, "lib/json/add/set.rb".freeze, "lib/json/add/struct.rb".freeze, "lib/json/add/symbol.rb".freeze, "lib/json/add/time.rb".freeze, "lib/json/common.rb".freeze, "lib/json/ext.rb".freeze, "lib/json/ext/generator.jar".freeze, "lib/json/ext/parser.jar".freeze, "lib/json/generic_object.rb".freeze, "lib/json/pure.rb".freeze, "lib/json/pure/generator.rb".freeze, "lib/json/pure/parser.rb".freeze, "lib/json/version.rb".freeze]
  s.homepage = "https://flori.github.io/json".freeze
  s.licenses = ["Ruby".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "JSON Implementation for Ruby".freeze
end
