Seteable [![Build Status](https://gitlab.com/frodsan/seteable/badges/master/build.svg)](https://gitlab.com/frodsan/seteable/builds)
========

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

Contributing
------------

Fork the project with:

```
$ git clone git@gitlab.com:frodsan/seteable.git
```

To install dependencies, use:

```
$ bundle install
```

To run the test suite, do:

```
$ rake test
```

For bug reports and pull requests use [GitLab][issues].

License
-------

Seteable is released under the [MIT License][mit].

[mit]: http://www.opensource.org/licenses/MIT
[issues]: https://gitlab.com/frodsan/seteable/issues
