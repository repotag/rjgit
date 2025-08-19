# -*- encoding: utf-8 -*-
# stub: csv 3.2.5 ruby lib

Gem::Specification.new do |s|
  s.name = "csv".freeze
  s.version = "3.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["James Edward Gray II".freeze, "Kouhei Sutou".freeze]
  s.date = "2022-08-26"
  s.description = "The CSV library provides a complete interface to CSV files and data. It offers tools to enable you to read and write to and from Strings or IO objects, as needed.".freeze
  s.email = [nil, "kou@cozmixng.org".freeze]
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "NEWS.md".freeze, "README.md".freeze, "doc/csv/recipes/filtering.rdoc".freeze, "doc/csv/recipes/generating.rdoc".freeze, "doc/csv/recipes/parsing.rdoc".freeze, "doc/csv/recipes/recipes.rdoc".freeze]
  s.files = ["LICENSE.txt".freeze, "NEWS.md".freeze, "README.md".freeze, "doc/csv/arguments/io.rdoc".freeze, "doc/csv/options/common/col_sep.rdoc".freeze, "doc/csv/options/common/quote_char.rdoc".freeze, "doc/csv/options/common/row_sep.rdoc".freeze, "doc/csv/options/generating/force_quotes.rdoc".freeze, "doc/csv/options/generating/quote_empty.rdoc".freeze, "doc/csv/options/generating/write_converters.rdoc".freeze, "doc/csv/options/generating/write_empty_value.rdoc".freeze, "doc/csv/options/generating/write_headers.rdoc".freeze, "doc/csv/options/generating/write_nil_value.rdoc".freeze, "doc/csv/options/parsing/converters.rdoc".freeze, "doc/csv/options/parsing/empty_value.rdoc".freeze, "doc/csv/options/parsing/field_size_limit.rdoc".freeze, "doc/csv/options/parsing/header_converters.rdoc".freeze, "doc/csv/options/parsing/headers.rdoc".freeze, "doc/csv/options/parsing/liberal_parsing.rdoc".freeze, "doc/csv/options/parsing/nil_value.rdoc".freeze, "doc/csv/options/parsing/return_headers.rdoc".freeze, "doc/csv/options/parsing/skip_blanks.rdoc".freeze, "doc/csv/options/parsing/skip_lines.rdoc".freeze, "doc/csv/options/parsing/strip.rdoc".freeze, "doc/csv/options/parsing/unconverted_fields.rdoc".freeze, "doc/csv/recipes/filtering.rdoc".freeze, "doc/csv/recipes/generating.rdoc".freeze, "doc/csv/recipes/parsing.rdoc".freeze, "doc/csv/recipes/recipes.rdoc".freeze, "lib/csv.rb".freeze, "lib/csv/core_ext/array.rb".freeze, "lib/csv/core_ext/string.rb".freeze, "lib/csv/fields_converter.rb".freeze, "lib/csv/input_record_separator.rb".freeze, "lib/csv/parser.rb".freeze, "lib/csv/row.rb".freeze, "lib/csv/table.rb".freeze, "lib/csv/version.rb".freeze, "lib/csv/writer.rb".freeze]
  s.homepage = "https://github.com/ruby/csv".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "CSV Reading and Writing".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<benchmark_driver>.freeze, [">= 0"])
    s.add_development_dependency(%q<test-unit>.freeze, [">= 3.4.8"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<benchmark_driver>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 3.4.8"])
  end
end
