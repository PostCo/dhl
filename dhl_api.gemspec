# frozen_string_literal: true

require_relative 'lib/dhl/version'

Gem::Specification.new do |spec|
  spec.name = 'dhl_api'
  spec.version = DHL::VERSION
  spec.authors = ['Andy Chong']
  spec.email = ['andy@youdontknow.me']

  spec.summary = 'Ruby API Wrapper for DHL'
  spec.homepage = 'https://github.com/PostCo/dhl'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/PostCo/dhl'
  spec.metadata['changelog_uri'] = 'https://github.com/PostCo/dhl/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'activesupport', '>= 4.0.2'
  spec.add_dependency 'http', '~> 5.0'

  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'gem-release'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'zeitwerk'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
