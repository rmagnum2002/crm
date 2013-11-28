require 'rubygems'
require 'rake/gempackagetask'

GEM_NAME = "vizjerai-query_trace"
GEM_VERSION = "0.2.2"
AUTHORS = ["Nathaniel Talbott", "Mike Gunderloy", "Andrew Assarattanakul"]
EMAIL = "nathaniel@terralien.com"
HOMEPAGE = "http://github.com/vizjerai/query_trace"
SUMMARY = "Adds query origin tracing to your logs."
DESCRIPTION = %q{With query_trace enabled, the Rails logs will contain a partial stack trace for every executed SQL statement, making it easier to find where they are generated in your code.}

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'query_trace'
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.summary = SUMMARY
  s.description = DESCRIPTION
  s.authors = AUTHORS
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('activerecord')
  s.require_path = 'lib'
  s.files = %w(MIT-LICENSE README Rakefile init.rb) + Dir.glob("{lib}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end
