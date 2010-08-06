require 'rubygems'
gem 'albacore', '=0.2.0.preview2'
require 'albacore'
require 'folders'

FileList["albacore/*.rb"].each { |f| require f }

task :default => [:setup, :assemblyinfo, :appconfig, :build, :build_tests, :test]

Albacore.configure do |config|
  config.csc.use :net35
  config.nunit.command = Commands[:nunit]
  config.expandtemplate
end

task :setup do
  FileUtils.mkdir Folders[:outdir] unless File.exist? Folders[:outdir]
  FileUtils.rm_f("#{Folders[:outdir]}/**/*")
  FileUtils.cp(Files[:nunitframework], Folders[:outdir])
end

assemblyinfo do |asm|
  asm.output_file = "src/assemblyinfo.cs"
  asm.version = "0.1.0.0"
  asm.copyright = "Copyright (C)2010 Derick Bailey."
end

expandtemplate :appconfig do |tmp|
  tmp.template = "templates/app.config.template"
  tmp.output = Files[:output] + ".config"
  tmp.settings( 
    :mysetting => "this is some settings",
    :connectionstring => "some connection string"
  )
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
