# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rext}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Holowaychuk"]
  s.date = %q{2009-03-23}
  s.description = %q{Ruby extensions}
  s.email = %q{tj@vision-media.ca}
  s.extra_rdoc_files = ["lib/rext/all.rb", "lib/rext/integer/time.rb", "lib/rext/integer.rb", "lib/rext/string/escape.rb", "lib/rext/string/helpers.rb", "lib/rext/string.rb", "lib/rext/version.rb", "lib/rext.rb", "README.rdoc", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/spec.rake"]
  s.files = ["History.rdoc", "lib/rext/all.rb", "lib/rext/integer/time.rb", "lib/rext/integer.rb", "lib/rext/string/escape.rb", "lib/rext/string/helpers.rb", "lib/rext/string.rb", "lib/rext/version.rb", "lib/rext.rb", "Manifest", "Rakefile", "README.rdoc", "spec/integer_spec.rb", "spec/spec_helper.rb", "spec/string_spec.rb", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/spec.rake", "Todo.rdoc", "rext.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/visionmedia/rext}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rext", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rext}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby extensions}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
