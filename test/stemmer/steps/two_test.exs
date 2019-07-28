defmodule Stemmer.Steps.TwoTest do
  use ExUnit.Case

  alias Stemmer.Steps.Two

  describe "execute/1" do
    test "it replaces a suffix based on porter rules 2" do
      assert Two.execute("relational") == "relate"
      assert Two.execute("conditional") == "condition"
      assert Two.execute("valenci") == "valence"
      assert Two.execute("hesitanci") == "hesitance"
      assert Two.execute("digitizer") == "digitize"
      assert Two.execute("conformabli") == "conformable"
      assert Two.execute("radicalli") == "radical"
      assert Two.execute("differentli") == "different"
      assert Two.execute("vileli") == "vile"
      assert Two.execute("analogousli") == "analogous"
      assert Two.execute("vietnamization") == "vietnamize"
      assert Two.execute("predication") == "predicate"
      assert Two.execute("operator") == "operate"
      assert Two.execute("feudalism") == "feudal"
      assert Two.execute("decisiveness") == "decisive"
      assert Two.execute("hopefulness") == "hopeful"
      assert Two.execute("callousness") == "callous"
      assert Two.execute("formaliti") == "formal"
      assert Two.execute("sensitiviti") == "sensitive"
      assert Two.execute("sensibiliti") == "sensible"
    end

    test "it does not replace a suffix based on porter rules 2" do
      assert Two.execute("rational") == "rational"
    end
  end
end
