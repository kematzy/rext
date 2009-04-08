# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rext}
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["TJ Holowaychuk"]
  s.date = %q{2009-04-08}
  s.description = %q{Ruby extensions}
  s.email = %q{tj@vision-media.ca}
  s.extra_rdoc_files = ["lib/rext/all.rb", "lib/rext/array/helpers.rb", "lib/rext/array.rb", "lib/rext/compat/basic_object.rb", "lib/rext/compat.rb", "lib/rext/date/helpers.rb", "lib/rext/date.rb", "lib/rext/enumerable/helpers.rb", "lib/rext/enumerable.rb", "lib/rext/hash/helpers.rb", "lib/rext/hash.rb", "lib/rext/integer/helpers.rb", "lib/rext/integer.rb", "lib/rext/module/helpers.rb", "lib/rext/module.rb", "lib/rext/numeric/bytes.rb", "lib/rext/numeric/time.rb", "lib/rext/numeric.rb", "lib/rext/object/helpers.rb", "lib/rext/object/metaclass.rb", "lib/rext/object.rb", "lib/rext/proc/helpers.rb", "lib/rext/proc.rb", "lib/rext/string/escape.rb", "lib/rext/string/helpers.rb", "lib/rext/string.rb", "lib/rext/time/helpers.rb", "lib/rext/time.rb", "lib/rext/version.rb", "lib/rext.rb", "README.rdoc", "tasks/benchmark.rake", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/spec.rake"]
  s.files = ["benchmarks/enumerable.rb", "benchmarks/proc.rb", "History.rdoc", "lib/rext/all.rb", "lib/rext/array/helpers.rb", "lib/rext/array.rb", "lib/rext/compat/basic_object.rb", "lib/rext/compat.rb", "lib/rext/date/helpers.rb", "lib/rext/date.rb", "lib/rext/enumerable/helpers.rb", "lib/rext/enumerable.rb", "lib/rext/hash/helpers.rb", "lib/rext/hash.rb", "lib/rext/integer/helpers.rb", "lib/rext/integer.rb", "lib/rext/module/helpers.rb", "lib/rext/module.rb", "lib/rext/numeric/bytes.rb", "lib/rext/numeric/time.rb", "lib/rext/numeric.rb", "lib/rext/object/helpers.rb", "lib/rext/object/metaclass.rb", "lib/rext/object.rb", "lib/rext/proc/helpers.rb", "lib/rext/proc.rb", "lib/rext/string/escape.rb", "lib/rext/string/helpers.rb", "lib/rext/string.rb", "lib/rext/time/helpers.rb", "lib/rext/time.rb", "lib/rext/version.rb", "lib/rext.rb", "Manifest", "Rakefile", "README.rdoc", "rext.gemspec", "spec/array_spec.rb", "spec/compat_spec.rb", "spec/date_spec.rb", "spec/enumerable_spec.rb", "spec/hash_spec.rb", "spec/integer_spec.rb", "spec/module_spec.rb", "spec/numeric_spec.rb", "spec/object_spec.rb", "spec/spec_helper.rb", "spec/string_spec.rb", "spec/time_spec.rb", "tasks/benchmark.rake", "tasks/docs.rake", "tasks/gemspec.rake", "tasks/spec.rake"]
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
