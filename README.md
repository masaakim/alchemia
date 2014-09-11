# Alchemia

Alchemia is Plugin framework for building AltCSS inspired by [Rework](https://github.com/reworkcss/rework).

## Installation

Add this line to your application's Gemfile:

    gem 'alchemia'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alchemia

## Usage

```ruby
require "alchemia"

css = ".selector { padding: 10px; }"

# Initialize and parse css to AST
alchemia = Alchemia.new(css)

# Include Alchemia plugins
alchemia.use(awesome_plugin)

# Stringify Alchemia AST
alchemia.to_s
```

## API

### Alchemia::use(plugin)
Include Alchemia plugin.

### Alchemia::to_s
Stringify processed CSS AST.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/alchemia/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
