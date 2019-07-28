defmodule Stemmer.Steps.FourTest do
  use ExUnit.Case

  alias Stemmer.Steps.Four

  describe "execute/1" do
    test "it replaces a suffix based on porter rules 4" do
      assert Four.execute("revival") == "reviv"
      assert Four.execute("allowance") == "allow"
      assert Four.execute("inference") == "infer"
      assert Four.execute("airliner") == "airlin"
      assert Four.execute("gyroscopic") == "gyroscop"
      assert Four.execute("adjustable") == "adjust"
      assert Four.execute("defensible") == "defens"
      assert Four.execute("irritant") == "irrit"
      assert Four.execute("replacement") == "replac"
      assert Four.execute("adjustment") == "adjust"
      assert Four.execute("dependent") == "depend"
      assert Four.execute("adoption") == "adopt"
      assert Four.execute("homologou") == "homolog"
      assert Four.execute("communism") == "commun"
      assert Four.execute("activate") == "activ"
      assert Four.execute("angulariti") == "angular"
      assert Four.execute("homologous") == "homolog"
      assert Four.execute("effective") == "effect"
      assert Four.execute("bowdlerize") == "bowdler"
    end
  end
end
