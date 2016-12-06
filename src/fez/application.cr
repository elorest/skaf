module Fez
  DBMAP = {"string" => %Q(["VARCHAR(255)", String]), "text" => %Q(["TEXT", String])}
  class Application
    getter name : String
    getter directory : String
    getter base_directory : String

    def initialize(@name : String, @base_directory = "/tmp" )
      @directory = File.join(@base_directory, @name)
    end

    # The directory will be the location plus the app name.
    # If this folder exists, raise an error so we don't erase it
    def build_directory
      puts "Building directory: #{@directory}"
      if Dir.exists?(@directory)
        raise "Directory #{@directory} already exists. Remove before continuing"
      else
        Dir.mkdir_p(@directory)
      end
    end

    # Get all the project files to be added, and compile them from ECR templates
    def add_project_files
      puts "adding files..."
      {% for name, path in Fez::Template::FILES %}
        path = "{{path.id}}" == "." ? File.join(@directory, "{{name.id}}") : File.join(@directory, "{{path.id}}", "{{name.id}}")
        puts path
        File.write(path, String.build { |__str__|
          ECR.embed("#{__DIR__}/../templates/{{name.id}}.ecr", "__str__")
        })
      {% end %}
    end

    # Create all of the project folders
    def add_project_folders
      Fez::Template::FOLDERS.each do |dir|
        Dir.mkdir_p(File.join(@directory, dir))
      end
    end

    # This generates a src/#{@name}.cr
    def add_initial_app_file
      script = File.read(File.join(__DIR__, "..", "templates", "main_script.cr"))
      File.write(File.join(@directory, "src", "#{@name}.cr"), script)
    end

    # This generates a spec/#{@name}_spec.cr
    def add_initial_spec_file
      script = File.read(File.join(__DIR__, "..", "templates", "main_spec.cr"))
      File.write(File.join(@directory, "src", "#{@name}_spec.cr"), script)
    end

    def add_scaffolding(scaff : String)
      cols = scaff.split(" ")
      scaff_name = cols.shift

      cols = cols.map{|c| f, l = c.split(":"); "    #{f}: #{DBMAP[l]}"}.join(",\n")
      script = String.build { |__str__|
        ECR.embed("#{__DIR__}/../templates/model.cr.ecr", "__str__")
      } 
      File.write(File.join(@directory, "src/models", "#{scaff_name.downcase}.cr"), script)
    end
  end
end
