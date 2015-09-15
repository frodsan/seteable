seteable
--------

Define settings for your library.

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

Check the [posten][posten] gem for a real example.

Installation
------------

```
$ gem install seteable
```

[posten]: https://github.com/harmoni/posten
