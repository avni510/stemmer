defmodule Stemmer.ConditionsTest do
  use ExUnit.Case

  alias Stemmer.Conditions

  describe "vc_greater_zero/2" do
    test "the vowel word count of the stem is greater than 0" do
      assert Conditions.vc_greater_zero("crossbreed", "eed")

      refute Conditions.vc_greater_zero("agreed", "agree")
    end
  end

  describe "vc_greater_one/2" do
    test "the vowel word count of the stem is greater than 0" do
      assert Conditions.vc_greater_one("revival", "al")

      refute Conditions.vc_greater_one("foo", "oo")
    end
  end

  describe "vowel_exists/2" do
    test "it checks if a vowel exists in the stem of the word" do
      assert Conditions.vowel_exists("plastered", "ed")

      refute Conditions.vowel_exists("bled", "ed")
    end
  end

  describe "default/2" do
    test "it checks if a string ends with a suffix" do
      assert Conditions.default("pumpkinseed", "eed")

      refute Conditions.default("foo", "a")
    end
  end

  describe "double_consonant_ending/2" do
    test "it checks if a word ends with a double consonant and does not end with letter x, w, y" do
      assert Conditions.double_consonant_ending("hopp", "")

      refute Conditions.double_consonant_ending("foo", "")
    end
  end

  describe "vc_one_ends_with_cvc/2" do
    test "it checks if a word ends with cvc and has a vc count of one" do
      assert Conditions.vc_one_ends_with_cvc("fil", "")

      refute Conditions.vc_one_ends_with_cvc("fail", "")
    end
  end

  describe "vc_greater_one_ends_with_st/2" do
    test "it checks if a word ends with s or t and has a vc greater than 1" do
      assert Conditions.vc_greater_one_ends_with_st("adoption", "ion")

      refute Conditions.vc_greater_one_ends_with_st("adtption", "ion")
    end
  end

  describe "vc_greater_one_double_consonant/2" do
    test "it checks if a word ends with l and a double consonant and has a vc greater than 1" do
      assert Conditions.vc_greater_one_double_consonant("controll", "")

      refute Conditions.vc_greater_one_double_consonant("controrrer", "er")
    end
  end
end
