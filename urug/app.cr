require "kemal"
require "kilt/slang"
require "./src/macros/*"
require "./src/urug.cr"

File.read_lines(".env").each do |line|
  key, value = line.strip.split "="
  ENV[key] = value
end

Kemal.config.port = ENV.fetch("PORT", "3000").to_i

Kemal.run
