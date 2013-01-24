# -*- encoding: utf-8 -*-
Version = "0.1"

Gem::Specification.new do |gem|
  gem.name          = "motion-pixate-observer"
  gem.version       = Version
  gem.authors       = ["Watson"]
  gem.email         = ["watson1978@gmail.com"]
  gem.description   = %q{motion-pixate-observer}
  gem.summary       = %q{motion-pixate-observer}
  gem.homepage      = ""

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*'))
  files.concat(Dir.glob('bin/**/*'))
  gem.files         = files
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
