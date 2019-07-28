defmodule Stemmer.Steps.OneBTest do
  use ExUnit.Case

  alias Stemmer.Steps.OneB

  describe "execute/1" do
    test "it replaces a suffix based on porter rules 1b" do
      assert OneB.execute("agreed") == "agree"
      assert OneB.execute("plastered") == "plaster"
      assert OneB.execute("motoring") == "motor"
    end

    test "it does not replace a suffix if it does not match rules 1b" do
      # ??
      # assert OneB.execute("feed") == "feed"
      assert OneB.execute("bled") == "bled"
      assert OneB.execute("sing") == "sing"
    end

    test "if it is the 2nd or 3rd condition it does additional replacements" do
      assert OneB.execute("conflated") == "conflate"
      assert OneB.execute("troubled") == "trouble"
      assert OneB.execute("sized") == "size"
      assert OneB.execute("hopping") == "hop"
      assert OneB.execute("tanned") == "tan"
      assert OneB.execute("falling") == "fall"
      assert OneB.execute("hissing") == "hiss"
      assert OneB.execute("fizzed") == "fizz"
      assert OneB.execute("failing") == "fail"
      assert OneB.execute("filing") == "file"
    end
  end
end
