$LOAD_PATH << File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = %q{range_operators}
  s.version     = '0.1.1'
  s.summary     = %q{A gem that adds range methods to Ruby's Range and Array classes. 
                    (Range#+, Range#-, Array#rangify, Array#intersection, Array#missing)}
  s.description = %q{A gem that adds range methods to Ruby's Range and Array classes. 
                    (Range#+, Range#-, Array#rangify, Array#intersection, Array#missing)}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- Appraisals {spec}/*`.split("\n")

  s.require_paths = ['lib']
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")

  s.authors = ['monocle']
  s.email   = ['frappez_2000@yahoo.com']

  s.homepage = 'http://github.com/monocle/range_operators'

  s.add_development_dependency('rspec', '~> 2.0')
end