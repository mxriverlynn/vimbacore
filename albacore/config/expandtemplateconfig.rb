module ExpandTemplateConfig
  include Albacore::Configuration

  def expandtemplate
    puts "..........Albacore.configure.expand template was called. This is a demonstration of the configuration plugin system.\r\n\r\n"
  end
end
