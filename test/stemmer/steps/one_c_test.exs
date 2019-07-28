defmodule Stemmer.Steps.OneCTest do
  use ExUnit.Case
  
  alias Stemmer.Steps.OneC

  describe "execute/1" do
    test "it replaces a suffix based on porter rules 1c" do
      assert OneC.execute("happy") == "happi"
    end

    test "it does not replace a suffix based on porter rules 1c" do
      assert OneC.execute("sky") == "sky"
    end
  end
end
