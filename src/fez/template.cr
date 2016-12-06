module Fez
  class Template
    FILES = {
      ".env"           => ".",
      ".gitignore"     => ".",
      ".travis.yml"    => ".",
      ".ruby-version"  => ".",
      "app.cr"         => ".",
      "es2js.rb"       => ".",
      "Gemfile"        => ".",
      "Guardfile"      => ".",
      "Makefile"       => ".",
      "README.md"      => ".",
      "shard.yml"      => ".",
      "robots.txt"     => "public",
      "favicon.ico"    => "public",
      "layout.slang"   => "src/views/layouts",
      "index.slang"    => "src/views/site",
      "helper.cr"      => "src/macros",
      "spec_helper.cr" => "spec",
      "site.scss"      => "src/assets/styles",
      "site.es6"       => "src/assets/scripts",
      "manifest.yml"   => "src/assets/scripts",
      "database.yml"   => "config"
    }

    FOLDERS = %w(
      public/stylesheets
      public/javascripts
      public/images
      src/views/layouts
      src/views/site
      src/macros
      src/models
      src/assets/styles
      src/assets/scripts
      spec
      config
    )
  end
end
