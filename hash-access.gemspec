# vim:filetype=ruby

require File.dirname(__FILE__) + "/lib/hash_access/version"

spec = Gem::Specification.new do |s|
  s.name = 'hash-access'
  s.version = HashAccess::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = 'Svetoslav Chernobay'
  s.email = 'slava@chernobay.info'
  s.homepage = 'http://github.com/slavach/hash-access'
  s.summary = 'Allows access to hash elements by methods'
  s.description = 'HashAccess library allows access to hash elements by calling methods'

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = 'hash-access'

  s.files = %w[ README.md LICENSE Rakefile ] + Dir.glob("{lib,lib/hash_access,spec}/*")
  s.require_paths = %w[ lib ]

  s.has_rdoc = true
  s.extra_rdoc_files = %w[ README.md LICENSE ]
  s.rdoc_options = %w[ --main=README --line-numbers --inline-source ]
end

