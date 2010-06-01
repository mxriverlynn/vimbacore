root_folder = File.expand_path(File.dirname(__FILE__))

@folders = {
  :root => root_folder,
  :outdir => File.join(root_folder, "build"),
  :tools => File.join(root_folder, "tools"),
  :nunit => File.join(root_folder, "tools", "nunit"),
  :net35 => "C:\\Windows\\Microsoft.NET\\framework\\v3.5"
}

@commands = {
  :nunit => File.join(@folders[:nunit], "nunit-console.exe"),
  :csc => File.join(@folders[:net35], "csc.exe")
}

@files = {
  :output => File.join(@folders[:outdir], "myproject.dll"),
  :nunitframework => File.join(@folders[:nunit], "nunit.framework.dll")
}
