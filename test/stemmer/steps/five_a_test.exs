defmodule Stemmer.Steps.FiveATest do
  use ExUnit.Case
  
  alias Stemmer.Steps.FiveA

  describe "execute/1" do
    test "it replaces a suffix based on porter rules 5a" do
      assert FiveA.execute("probate") == "probat"
      assert FiveA.execute("cease") == "ceas"
    end

    test "it does not replace a suffix based on porter rules 5a" do
      assert FiveA.execute("rate") == "rate"
    end
  end
end
