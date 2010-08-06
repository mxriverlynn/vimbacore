require 'rubygems'
gem 'albacore', '=0.2.0.preview2'
require 'albacore'
require 'folders'

task :default => [:setup, :build, :build_tests, :test]

Albacore.configure do |config|
  config.csc.use :net35
  config.nunit.command = Commands[:nunit]
end

task :setup do
  FileUtils.mkdir Folders[:outdir] unless File.exist? Folders[:outdir]
  FileUtils.rm_f("#{Folders[:outdir]}/**/*")
  FileUtils.cp(Files[:nunitframework], Folders[:outdir])
end

csc :build do |csc|
  csc.compile FileList["src/**/*.cs"].exclude("src/**/*Specs.cs")
  csc.output = Files[:output]
  csc.target = :library
end

csc :build_tests do |csc|
  csc.compile FileList["src/**/*Specs.cs"]
  csc.output = Files[:testdll]
  csc.target = :library
  csc.references Files[:output], Files[:nunitframework]
end

nunit :test do |nunit|
  nunit.assemblies Files[:testdll]
end
