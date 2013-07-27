# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'russian_metaphone/version'

Gem::Specification.new do |gem|
  gem.name          = "russian_metaphone"
  gem.version       = RussianMetaphone::VERSION
  gem.authors       = ["Pavlo V. Lysov"]
  gem.email         = ["pavlo@cleverua.com"]
  gem.description   = %q{Implements 'Metaphone' phonetic algorithm adapted for Russian language}
  gem.summary       = %q{Implements 'Metaphone' phonetic algorithm adapted for Russian language, allows easy extending and algorithm tuning.}
  gem.homepage      = "https://github.com/cleverua/russian_metaphone"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("unicode", ">= 0.4.4")
  gem.add_development_dependency "rspec"
end
