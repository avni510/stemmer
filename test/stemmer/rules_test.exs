defmodule Stemmer.RulesTest do
  use ExUnit.Case

  alias Stemmer.Rules

  describe "has_vowel/1" do
    test "it returns true if a word has a vowel and false otherwise" do
      assert Rules.has_vowel?("foo")
      assert Rules.has_vowel?("bar")
      assert Rules.has_vowel?("ygy")

      refute Rules.has_vowel?("qsdf")
      refute Rules.has_vowel?("bnm")
    end
  end

  describe "vc_count/1" do
    test "it returns the 0 for vowel consonant combinations in a word" do
      assert Rules.vc_count("tr") == 0
      assert Rules.vc_count("ee") == 0
      assert Rules.vc_count("y") == 0
      assert Rules.vc_count("by") == 0
    end

    test "it returns the 1 for vowel consonant combinations in a word" do
      assert Rules.vc_count("trouble") == 1
      assert Rules.vc_count("oats") == 1
      assert Rules.vc_count("trees") == 1
      assert Rules.vc_count("ivy") == 1
      assert Rules.vc_count("fil") == 1 
    end

    test "it returns the 2 for vowel consonant combinations in a word" do
      assert Rules.vc_count("troubles") == 2
      assert Rules.vc_count("private") == 2
      assert Rules.vc_count("oaten") == 2
      assert Rules.vc_count("orrery") == 2
    end
  end

  describe "has_double_consonant/1" do
    test "it returns true for words that end in double consonants" do
      assert Rules.ends_with_consonants?("bell") 
      assert Rules.ends_with_consonants?("bass") 
      assert Rules.ends_with_consonants?("staff")
      assert Rules.ends_with_consonants?("fizz") 
    end

    test "it returns false for words that do not end in double consonants" do
      refute Rules.ends_with_consonants?("foo") 
      refute Rules.ends_with_consonants?("bar") 
      refute Rules.ends_with_consonants?("hello")
      refute Rules.ends_with_consonants?("world") 
    end
  end

  describe "ends_with_cvc?/1" do
    test "it returns true for words that end in cvc with the second c not being w, x, or y" do
      assert Rules.ends_with_cvc?("wil")
      assert Rules.ends_with_cvc?("hop")

      refute Rules.ends_with_cvc?("wix")
      refute Rules.ends_with_cvc?("hoy")
      refute Rules.ends_with_cvc?("ceas")
    end
  end
end
