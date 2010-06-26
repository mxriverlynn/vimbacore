root_folder = File.expand_path(File.dirname(__FILE__))

@folders = {
  :root => root_folder,
  :outdir => File.join(root_folder, "build"),
  :tools => File.join(root_folder, "tools"),
  :nunit => File.join(root_folder, "tools", "nunit")
}

@commands = {
  :nunit => File.join(@folders[:nunit], "nunit-console.exe")
}

@files = {
  :output => File.join(@folders[:outdir], "myproject.dll"),
  :testdll => File.join(@folders[:outdir], "myproject.specs.dll"),
  :nunitframework => File.join(@folders[:nunit], "nunit.framework.dll")
}
