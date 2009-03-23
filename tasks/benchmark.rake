
desc 'Run benchmark suites n TIMES, defaulting to 1000'
task :benchmark do
  $times = ENV['TIMES'] || 1000
  begin
    require 'rext/all'
    require 'rubygems'
    require 'rgauge'
  rescue LoadError
    abort 'visionmedia-rgauge is required, grab it from github'
  end
  Dir['benchmarks/*.rb'].each { |f| load f } 
end