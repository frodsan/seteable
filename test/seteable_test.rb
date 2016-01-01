require "bundler/setup"
require "minitest/autorun"
require "minitest/pride"
require "minitest/sugar"
require_relative "../lib/seteable"

class SeteableTest < Minitest::Test
  test "settings" do
    class Base
      include Seteable
    end

    Base.settings[:foo] = "foo"

    assert_equal "foo", Base.settings[:foo]
    assert_equal "foo", Base.new.settings[:foo]
  end

  test "inheritance" do
    class Parent
      include Seteable
    end

    Parent.settings[:foo] = "foo"

    class Child < Parent
    end

    assert_equal "foo", Child.settings[:foo]
  end

  test "look up parent if setting not exists" do
    class Foo
      include Seteable
    end

    class Bar < Foo
    end

    class Baz < Bar
    end

    Foo.settings[:foo] = "foo"
    Bar.settings[:bar] = "bar"

    assert_equal "foo", Bar.settings[:foo]
    assert_equal "foo", Baz.settings[:foo]
    assert_equal "bar", Baz.settings[:bar]

    Bar.settings[:foo] = "bar"

    assert_equal "bar", Bar.settings[:foo]
    assert_equal "foo", Baz.settings[:foo]
  end
end