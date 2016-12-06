require "./fez/*"
require "option_parser"
require "ecr/macros"

# Default Values
application_name = Dir.current.split("/").last
application_directory = File.join(Dir.current.split("/")[0..-2])
scaffold = ""

# Parse the CLI options
OptionParser.parse! do |parser|
  parser.banner = "Usage: fez [arguments]"
  parser.on("-b NAME", "--build=NAME", "Set the NAME of the app") { |name| 
    application_name = name
    application_directory = Dir.current
  }
  parser.on("-d DIR", "--directory=DIR", "Set the DIR where the app will be built") { |dir| application_directory = dir }
  parser.on("-v", "--version", "Fez version") { puts "Fez v#{Fez::VERSION}"; exit }
  parser.on("-h", "--help", "Show this help") { puts parser; exit }
  parser.on("-s PARAMS", "Generates Scaffolding"){|params| scaffold = params}
end

puts "Building #{application_name}"
new_app = Fez::Application.new(application_name, application_directory)

if scaffold.size > 0
  new_app.add_scaffolding(scaffold)
else
  # Start the application
  new_app.build_directory
  new_app.add_project_folders
  new_app.add_project_files
  new_app.add_initial_app_file
end
