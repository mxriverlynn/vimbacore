root_folder = File.expand_path(File.dirname(__FILE__))

Folders = {
  :root => root_folder,
  :outdir => File.join(root_folder, "build"),
  :tools => File.join(root_folder, "tools"),
  :nunit => File.join(root_folder, "tools", "nunit")
}

Commands = {
  :nunit => File.join(Folders[:nunit], "nunit-console.exe")
}

Files = {
  :output => File.join(Folders[:outdir], "myproject.dll"),
  :testdll => File.join(Folders[:outdir], "myproject.specs.dll"),
  :nunitframework => File.join(Folders[:nunit], "nunit.framework.dll")
}
