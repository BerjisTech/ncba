# frozen_string_literal: true

require_relative 'lib/ncba/version'

Gem::Specification.new do |spec|
  spec.name          = 'ncba'
  spec.version       = Ncba::VERSION
  spec.authors       = ['Prometheus']
  spec.email         = ['info@berjis.tech']

  spec.summary       = 'NCBA Open Banking API Ruby client'
  spec.description   = 'Ruby wrapper for the NCBA Open Banking API. Supports token-based authentication, ' \
                       'account queries, fund transfers (IFT, EFT, RTGS, Pesalink), and bill payments.'
  spec.homepage      = 'https://github.com/BerjisTech/ncba'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/BerjisTech/ncba'
  spec.metadata['changelog_uri'] = 'https://github.com/BerjisTech/ncba/blob/main/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 2.0'
end
