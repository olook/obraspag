# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "obraspag"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Olook"]
  s.date = "2012-10-29"
  s.description = "API Braspag"
  s.email = "development@olook.com.br"
  s.extra_rdoc_files = ["README.rdoc", "lib/obraspag.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/obraspag.rb", "Manifest", "obraspag.gemspec"]
  s.homepage = "https://github.com/olook/obraspag"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Obraspag", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "obraspag"
  s.rubygems_version = "1.8.24"
  s.summary = "API Braspag"

  s.add_dependency 'savon', '>= 0.9.9'
  s.add_dependency 'httpi', '>= 0.9.6'
  s.add_dependency 'json', '>= 1.6.1'
  s.add_dependency 'nokogiri', '>= 1.4.7'

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "pry"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
