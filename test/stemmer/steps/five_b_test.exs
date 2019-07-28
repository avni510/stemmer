defmodule Stemmer.Steps.FiveBTest do
  use ExUnit.Case

  alias Stemmer.Steps.FiveB

  describe "execute/1" do
    test "it replaces a suffix based on porter rules 5b" do
      assert FiveB.execute("controll") == "control"
    end

    test "it does not replace a suffix based on porter rules 5b" do
      assert FiveB.execute("roll") == "roll"
    end
  end
end
