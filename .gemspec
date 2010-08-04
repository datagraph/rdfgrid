#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

GEMSPEC = Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'rdfgrid'
  gem.homepage           = 'http://rdfgrid.rubyforge.org/'
  gem.license            = 'Public Domain' if gem.respond_to?(:license=)
  gem.summary            = 'Map/Reduce pipelines for RDF.rb.'
  gem.description        = 'RDFgrid is a framework for batch-processing RDF data with Hadoop and Amazon Elastic MapReduce.'
  gem.rubyforge_project  = 'rdfgrid'

  gem.authors            = ['Datagraph']
  gem.email              = 'rdfgrid@googlegroups.com'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(AUTHORS README UNLICENSE VERSION bin/rdfgrid) + Dir.glob('lib/**/*.rb')
  gem.bindir             = %q(bin)
  gem.executables        = %w(rdfgrid)
  gem.default_executable = gem.executables.first
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()
  gem.has_rdoc           = false

  gem.required_ruby_version      = '>= 1.8.1'
  gem.requirements               = []
  gem.add_development_dependency 'yard' ,    '>= 0.5.8'
  gem.add_development_dependency 'rspec',    '>= 1.3.0'
  gem.add_development_dependency 'rdf-spec', '~> 0.2.2'
  gem.add_runtime_dependency     'rdf',      '~> 0.2.2'
  gem.post_install_message       = nil
end
