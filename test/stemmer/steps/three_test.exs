defmodule Stemmer.Steps.ThreeTest do
  use ExUnit.Case

  alias Stemmer.Steps.Three

  describe "execute/1" do
    test "it replaces a suffix based on porter rules 3" do
      assert Three.execute("triplicate") == "triplic"
      assert Three.execute("formative") == "form"
      assert Three.execute("formalize") == "formal"
      assert Three.execute("electriciti") == "electric"
      assert Three.execute("electrical") == "electric"
      assert Three.execute("hopeful") == "hope"
      assert Three.execute("goodness") == "good"
    end
  end
end
