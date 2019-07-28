defmodule StemmerTest do
  use ExUnit.Case

  alias Stemmer

  describe "run/1" do
    test "it stems a word" do
      assert Stemmer.run("abrogated") == "abrog"
    end

    test "it stems a string of words" do
      assert Stemmer.run("extraordinary capabilities") == "extraordinari capabl"
    end

    test "it stems a list of words" do
      assert Stemmer.run(["Removing", "suffixes", "by"]) == ["remov", "suffix", "by"]
    end

    test "it does not stem a word less than 2 letters" do
      assert Stemmer.run("a") == "a" 
    end
  end
end
