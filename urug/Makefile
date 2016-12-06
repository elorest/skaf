all: install                                                             

# install ruby and crystal dependencies
install:
\tshards install
\tbundle install

# Compiles scripts and styles
assets:
\tsass --update src/assets/styles:public/stylesheets --style compressed
\truby es2js.rb

# Compile assets then run app
run: assets
\tcrystal app.cr

