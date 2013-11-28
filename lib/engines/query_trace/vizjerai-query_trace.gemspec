# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{vizjerai-query_trace}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathaniel Talbott", "Mike Gunderloy", "Andrew Assarattanakul"]
  s.date = %q{2011-02-16}
  s.description = %q{With query_trace enabled, the Rails logs will contain a partial stack trace for every executed SQL statement, making it easier to find where they are generated in your code.}
  s.email = %q{nathaniel@terralien.com}
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README", "Rakefile", "init.rb", "lib/query_trace.rb"]
  s.homepage = %q{http://github.com/vizjerai/query_trace}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{query_trace}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Adds query origin tracing to your logs.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 0"])
  end
end
