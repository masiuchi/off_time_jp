# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'off_time_jp/version'

Gem::Specification.new do |spec|
  spec.name          = "off_time_jp"
  spec.version       = OffTimeJp::VERSION
  spec.authors       = ["Masahiro IUCHI"]
  spec.email         = ["masahiro.iuchi@gmail.com"]

  spec.summary       = %q{Japanse off time.}
  spec.description   = %q{Japanse off time.}
  spec.homepage      = "https://github.com/masiuchi/off_time_jp"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "holiday_jp", "~> 0.5"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "timecop", "~> 0.8"
end
