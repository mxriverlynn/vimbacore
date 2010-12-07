require 'erb'

class ExpandTemplate
  module GetBinding
    def get_binding
      binding
    end
  end

  include Albacore::Task

  attr_accessor :template, :output
  attr_hash :settings

  def execute
    expand_template(@template, @output, @settings)
  end

  def expand_template(template_file, output_file, settings)
    template = File.read template_file

    vars = OpenStruct.new(settings)
    vars.extend GetBinding
    vars_binding = vars.get_binding

    erb = ERB.new template
    output = erb.result(vars_binding)

    File.open(output_file, "w") do |file|
      puts "Generating #{file.path}"
      file.write(output)
    end
  end
end

