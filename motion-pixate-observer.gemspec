# -*- encoding: utf-8 -*-
Version = "0.5"

Gem::Specification.new do |gem|
  gem.name          = "motion-pixate-observer"
  gem.version       = Version
  gem.authors       = ["Watson"]
  gem.email         = ["watson1978@gmail.com"]
  gem.description   = %q{This gem provides a function that you changes css files, apply changes into your application that uses Pixate Framework immediately.}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/Watson1978/motion-pixate-observer"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*'))
  files.concat(Dir.glob('bin/**/*'))
  gem.files         = files
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'dnssd'
  gem.add_runtime_dependency 'fssm'
end
