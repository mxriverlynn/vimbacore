require 'rubygems'
gem 'albacore', '=0.2.0.pre1'
require 'albacore'
require 'folders'

task :default => [:setup, :build, :test]

Albacore::log_level = :verbose

task :setup do
  FileUtils.rmtree @folders[:outdir] if File.exist?(@folders[:outdir])
  FileUtils.mkdir @folders[:outdir] 
  FileUtils.cp(@files[:nunitframework], @folders[:outdir])
end

csc :build do |csc|
  csc.command = @commands[:csc]
  csc.compile FileList["src/**/*.cs"]
  csc.output = @files[:output]
  csc.target = :library
  csc.references @files[:nunitframework]
end

nunit :test do |nunit|
  nunit.command = @commands[:nunit]
  nunit.assemblies @files[:output]
end
