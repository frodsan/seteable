Seteable [![Build Status](https://travis-ci.org/frodsan/seteable.svg)](https://travis-ci.org/frodsan/seteable)
--------

Define settings for your library.

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem "seteable"
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install seteable
```

Usage
-----

Use the `settings` method to set and get values:

```ruby
class Base
  include Seteable
end

Base.settings[:foo] = "foo"

Base.settings[:foo]     # => "foo"
Base.new.settings[:foo] # => "foo"
```

Settings are inherited:

```ruby
class Parent
  include Seteable

  settings[:foo] = "foo"
end

class Child < Parent
  settings[:bar] = "bar"
end

Child.settings[:foo] # => "foo"
Child.settings[:bar] # => "bar"
```

Installation
------------

```
$ gem install seteable
```

Contributing
------------

Fork the project with:

```
$ git clone git@github.com:frodsan/seteable.git
```

To install dependencies, use:

```
$ bundle install
```

To run the test suite, do:

```
$ rake test
```

For bug reports and pull requests use [GitHub][issues].

License
-------

Seteable is released under the [MIT License][mit].

[mit]: http://www.opensource.org/licenses/MIT
[issues]: https://github.com/frodsan/seteable/issues
