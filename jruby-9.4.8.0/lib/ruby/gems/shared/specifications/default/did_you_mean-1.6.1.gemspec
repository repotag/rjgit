# -*- encoding: utf-8 -*-
# stub: did_you_mean 1.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "did_you_mean".freeze
  s.version = "1.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yuki Nishijima".freeze]
  s.date = "2021-12-22"
  s.description = "The gem that has been saving people from typos since 2014.".freeze
  s.email = ["mail@yukinishijima.net".freeze]
  s.files = [".github/workflows/ruby.yml".freeze, ".gitignore".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "appveyor.yml".freeze, "benchmark/jaro_winkler/memory_usage.rb".freeze, "benchmark/jaro_winkler/speed.rb".freeze, "benchmark/levenshtein/memory_usage.rb".freeze, "benchmark/levenshtein/speed.rb".freeze, "benchmark/memory_usage.rb".freeze, "benchmark/require_path_checker.rb".freeze, "benchmark/speed.yml".freeze, "did_you_mean.gemspec".freeze, "documentation/CHANGELOG.md.erb".freeze, "documentation/changelog_generator.rb".freeze, "documentation/human_typo_api.md".freeze, "documentation/tree_spell_algorithm.md".freeze, "documentation/tree_spell_checker_api.md".freeze, "lib/did_you_mean.rb".freeze, "lib/did_you_mean/core_ext/name_error.rb".freeze, "lib/did_you_mean/experimental.rb".freeze, "lib/did_you_mean/formatter.rb".freeze, "lib/did_you_mean/formatters/plain_formatter.rb".freeze, "lib/did_you_mean/formatters/verbose_formatter.rb".freeze, "lib/did_you_mean/jaro_winkler.rb".freeze, "lib/did_you_mean/levenshtein.rb".freeze, "lib/did_you_mean/spell_checker.rb".freeze, "lib/did_you_mean/spell_checkers/key_error_checker.rb".freeze, "lib/did_you_mean/spell_checkers/method_name_checker.rb".freeze, "lib/did_you_mean/spell_checkers/name_error_checkers.rb".freeze, "lib/did_you_mean/spell_checkers/name_error_checkers/class_name_checker.rb".freeze, "lib/did_you_mean/spell_checkers/name_error_checkers/variable_name_checker.rb".freeze, "lib/did_you_mean/spell_checkers/null_checker.rb".freeze, "lib/did_you_mean/spell_checkers/pattern_key_name_checker.rb".freeze, "lib/did_you_mean/spell_checkers/require_path_checker.rb".freeze, "lib/did_you_mean/tree_spell_checker.rb".freeze, "lib/did_you_mean/verbose.rb".freeze, "lib/did_you_mean/version.rb".freeze, "test/core_ext/test_name_error_extension.rb".freeze, "test/edit_distance/test_jaro_winkler.rb".freeze, "test/fixtures/book.rb".freeze, "test/fixtures/mini_dir.yml".freeze, "test/fixtures/rspec_dir.yml".freeze, "test/helper.rb".freeze, "test/spell_checking/test_class_name_check.rb".freeze, "test/spell_checking/test_key_name_check.rb".freeze, "test/spell_checking/test_method_name_check.rb".freeze, "test/spell_checking/test_pattern_key_name_check.rb".freeze, "test/spell_checking/test_require_path_check.rb".freeze, "test/spell_checking/test_uncorrectable_name_check.rb".freeze, "test/spell_checking/test_variable_name_check.rb".freeze, "test/test_ractor_compatibility.rb".freeze, "test/test_spell_checker.rb".freeze, "test/test_tree_spell_checker.rb".freeze, "test/tree_spell/change_word.rb".freeze, "test/tree_spell/human_typo.rb".freeze, "test/tree_spell/test_change_word.rb".freeze, "test/tree_spell/test_explore.rb".freeze, "test/tree_spell/test_human_typo.rb".freeze]
  s.homepage = "https://github.com/ruby/did_you_mean".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "\"Did you mean?\" experience in Ruby".freeze
  s.test_files = ["test/core_ext/test_name_error_extension.rb".freeze, "test/edit_distance/test_jaro_winkler.rb".freeze, "test/fixtures/book.rb".freeze, "test/fixtures/mini_dir.yml".freeze, "test/fixtures/rspec_dir.yml".freeze, "test/helper.rb".freeze, "test/spell_checking/test_class_name_check.rb".freeze, "test/spell_checking/test_key_name_check.rb".freeze, "test/spell_checking/test_method_name_check.rb".freeze, "test/spell_checking/test_pattern_key_name_check.rb".freeze, "test/spell_checking/test_require_path_check.rb".freeze, "test/spell_checking/test_uncorrectable_name_check.rb".freeze, "test/spell_checking/test_variable_name_check.rb".freeze, "test/test_ractor_compatibility.rb".freeze, "test/test_spell_checker.rb".freeze, "test/test_tree_spell_checker.rb".freeze, "test/tree_spell/change_word.rb".freeze, "test/tree_spell/human_typo.rb".freeze, "test/tree_spell/test_change_word.rb".freeze, "test/tree_spell/test_explore.rb".freeze, "test/tree_spell/test_human_typo.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
