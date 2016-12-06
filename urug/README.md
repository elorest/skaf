# urug

TODO: add description

## Requirements

* [Ruby](https://www.ruby-lang.org/)
* [Crystal](https://crystal-lang.org/)

## Installation

```text
$ git clone
$ cd urug
$ make install
$ make run
```

## Development

Using [Guard](https://github.com/guard/guard) for development auto-reload. Just running the `guard` command will watch your `src/urug.cr` file for changes. After you save your changes to this file, kemal will auto-reload for you.

```text
$ guard
```

### Stylesheets

Add your main stylesheet file in to `src/assets/styles`. This file should end in `.sass` or `.scss` like `src/assets/styles/application.scss`. 
If you would like to break your styles in to multiple files (i.e. mixins, variables, header, etc...) just throw those files in to the same directory and name them `_whatever_you_want.scss`. Notice the `_` at the beginning. This is so sass doesn't compile separate files for each one. Then just be sure to `@import "whatever_you_want";` so it gets added in when compiled.

Using `make run` will first compile your styles, and then generate your `public/stylesheets/application.css` file. You can also compile at any time with `make assets`.

### Javascripts

Add your main javascript file in to `src/assets/scripts`. This file should end in `.es6` like `src/assets/scripts/application.es6`.
You can write full ES6 compatible javascript in these, and they will be compiled to cross-browser compatible scripts using [Babel](https://babeljs.io/) when your app is booted, or the `make assets` task is ran. When they are compiled, the source is placed in `public/javascripts/application.js` or whatever you named the script dot js.

