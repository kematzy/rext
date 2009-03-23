
$:.unshift 'lib'
require 'rext'
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new "rext", Rext::VERSION do |p|
  p.author = "TJ Holowaychuk"
  p.email = "tj@vision-media.ca"
  p.summary = "Ruby extensions"
  p.url = "http://github.com/visionmedia/rext"
  p.runtime_dependencies = []
end

Dir['tasks/**/*.rake'].sort.each { |lib| load lib }