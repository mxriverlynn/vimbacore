require 'rubygems'
gem 'albacore', '=0.2.0.pre1'
require 'albacore'
require 'folders'

task :default => [:setup, :build, :build_tests, :test]

Albacore::log_level = :verbose

task :setup do
  FileUtils.mkdir @folders[:outdir] unless File.exist? @folders[:outdir]
  FileUtils.rm_f("#{@folders[:outdir]}/**/*")
  FileUtils.cp(@files[:nunitframework], @folders[:outdir])
end

csc :build do |csc|
  csc.command = @commands[:csc]
  csc.compile FileList["src/**/*.cs"].exclude("src/**/*Specs.cs")
  csc.output = @files[:output]
  csc.target = :library
end

csc :build_tests do |csc|
  csc.command = @commands[:csc]
  csc.compile FileList["src/**/*Specs.cs"]
  csc.output = @files[:testdll]
  csc.target = :library
  csc.references @files[:output], @files[:nunitframework]
end

nunit :test do |nunit|
  nunit.command = @commands[:nunit]
  nunit.assemblies @files[:testdll]
end
