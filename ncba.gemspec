# frozen_string_literal: true

require_relative 'lib/ncba/version'

Gem::Specification.new do |spec|
  spec.name          = 'ncba'
  spec.version       = Ncba::VERSION
  spec.authors       = ['Prometheus']
  spec.email         = ['info@berjis.tech']

  spec.summary       = 'NCBA OPEN BANKING API'
  spec.description   = 'The NCBA gem is a wrapper that helps developers interface with the official [NCBA OPEN BANKING API](http://developers.cbagroup.com:4040/home).'
  spec.homepage      = 'https://github.com/BerjisTech/ncba'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/BerjisTech/ncba'
  spec.metadata['changelog_uri'] = 'https://github.com/BerjisTech/ncba/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency 'bundler', '~> 2.1', '>= 2.1.4'
  spec.add_development_dependency 'rake', '~> 12.3'

  spec.add_runtime_dependency 'activesupport', '~> 5.0', '>= 5.0.0'
  spec.add_runtime_dependency 'faraday', '~> 1.1'
  spec.add_runtime_dependency 'faraday_middleware', '~> 1.1'
  spec.add_runtime_dependency 'openssl', '~> 2.1'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
