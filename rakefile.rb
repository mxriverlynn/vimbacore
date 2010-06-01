require 'rubygems'
gem 'albacore', '=0.2.0.preview1'
require 'albacore'
require 'folders'

task :default => [:setup, :build, :test]

task :setup do
  FileUtils.mkdir @folders[:outdir] unless File.exist?(@folders[:outdir])
end

csc :build do |csc|
  csc.compile FileList["src/**/*.cs"]
  csc.output = @files[:output]
  csc.target = :library
  csc.reference @files[:nunitframework]
end

nunit :test do |nunit|
  nunit.command = @commands[:nunit]
  nunit.assemblies @files[:output]
end
