# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-leaders'
  s.authors           = ['Romain Binaux']
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Leaders extension for Refinery CMS'
  s.date              = '2012-07-05'
  s.summary           = 'Leaders extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms',         '~> 2.1.0.dev'
  s.add_dependency             'acts_as_indexed',     '~> 0.7'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.0.dev'
end
