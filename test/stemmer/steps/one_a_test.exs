defmodule Stemmer.Steps.OneATest do
  use ExUnit.Case

  alias Stemmer.Steps.OneA

  describe "execute/1" do
    test "it replaces a suffix based on porter rules 1a" do
      assert OneA.execute("caresses") == "caress"
      assert OneA.execute("ponies") == "poni"
      assert OneA.execute("ties") == "ti"
      assert OneA.execute("caress") == "caress"
      assert OneA.execute("cats") == "cat"
    end

    test "it does not replace a suffix if it does not match rules 1a" do
      assert OneA.execute("foo") == "foo"
      assert OneA.execute("bar") == "bar"
    end
  end
end
