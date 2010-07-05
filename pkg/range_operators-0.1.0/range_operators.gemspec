# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{range_operators}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["monocle"]
  s.cert_chain = ["/ruby/keys/range_operators/gem-public_cert.pem"]
  s.date = %q{2010-07-04}
  s.description = %q{A gem that adds range methods to Ruby's Range and Array classes. (Range#+, Range#-, Array#rangify, Array#intersection, Array#missing)}
  s.email = %q{frappez_2000@yahoo.com}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc", "lib/range_operators.rb", "lib/range_operators/array_operator_definitions.rb", "lib/range_operators/range_operator_definitions.rb"]
  s.files = ["LICENSE", "Manifest", "README.rdoc", "Rakefile", "lib/range_operators.rb", "lib/range_operators/array_operator_definitions.rb", "lib/range_operators/range_operator_definitions.rb", "range_operators.gemspec", "spec/array_operator_definitions_spec.rb", "spec/range_operators_spec.rb"]
  s.homepage = %q{http://github.com/monocle/range_operators}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Range_operators", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{range_operators}
  s.rubygems_version = %q{1.3.6}
  s.signing_key = %q{/ruby/keys/range_operators/gem-private_key.pem}
  s.summary = %q{A gem that adds range methods to Ruby's Range and Array classes. (Range#+, Range#-, Array#rangify, Array#intersection, Array#missing)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
