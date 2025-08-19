# -*- encoding: utf-8 -*-
# stub: rake-ant 1.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "rake-ant".freeze
  s.version = "1.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas E Enebo".freeze, "Charles Oliver Nutter".freeze]
  s.date = "2022-10-31"
  s.email = ["tom.enebo@gmail.com".freeze, "headius@headius.com".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "lib/ant.rb".freeze, "lib/rake/ant.rb".freeze, "lib/rake/ant/ant.rb".freeze, "lib/rake/ant/element.rb".freeze, "lib/rake/ant/project_converter.rb".freeze, "lib/rake/ant/rake.rb".freeze, "lib/rake/ant/target.rb".freeze, "lib/rake/ant/tasks/raketasks.rb".freeze, "lib/rake/ant/version.rb".freeze]
  s.homepage = "https://github.com/jruby/rake-ant".freeze
  s.licenses = ["EPL-2.0".freeze]
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Ant tasks and integration for Rake".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.1"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 2.1"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
  end
end
