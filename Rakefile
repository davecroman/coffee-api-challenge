require 'pacto/rake_task'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib"]
  t.warning = true
  t.verbose = true
  t.test_files = FileList['tests/tc_*.rb']
end
