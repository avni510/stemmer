defmodule Stemmer.Conditions do
  alias Stemmer.Rules

  def vc_greater_zero(word, suffix) do
    extra_cond = &Rules.vc_count(&1) > 0

    general_condition(extra_cond, word, suffix)
  end

  def vc_greater_one(word, suffix) do
    extra_cond = &Rules.vc_count(&1) > 1

    general_condition(extra_cond, word, suffix)
  end

  def vowel_exists(word, suffix) do
    extra_cond = &Rules.has_vowel?(&1)

    general_condition(extra_cond, word, suffix)
  end

  def default(word, suffix) do
    general_condition(fn _ -> true end, word, suffix)
  end

  def double_consonant_ending(word, suffix) do
    extra_cond = &(
      Rules.ends_with_consonants?(&1) &&
      not String.ends_with?(&1, "l") &&
      not String.ends_with?(&1, "s") &&
      not String.ends_with?(&1, "z")
    )

    general_condition(
      extra_cond,
      word,
      suffix
    )
  end

  def vc_one_ends_with_cvc(word, suffix) do
    extra_cond = &(
      Rules.vc_count(&1) == 1 && 
      Rules.ends_with_cvc?(&1)
    )

    general_condition(extra_cond, word, suffix)
  end

  def vc_one_not_ends_with_cvc(word, suffix) do
    extra_cond = &(
      Rules.vc_count(&1) == 1 &&
      not Rules.ends_with_cvc?(&1)
    )

    general_condition(extra_cond, word, suffix)
  end

  def vc_greater_one_ends_with_st(word, suffix) do
    extra_cond = &(
      Rules.vc_count(&1) > 1 && 
      (String.ends_with?(&1, "t") || String.ends_with?(&1, "s"))
    )

    general_condition(extra_cond, word, suffix)
  end

  def vc_greater_one_double_consonant(word, suffix) do
    extra_cond = &(
      Rules.vc_count(&1) > 1 && 
      Rules.ends_with_consonants?(&1) &&
      String.ends_with?(&1, "l") 
    )

    general_condition(extra_cond, word, suffix)
  end

  defp general_condition(extra_cond, word, suffix) do
    if String.ends_with?(word, suffix) do
       word
       |> String.replace_suffix(suffix, "")
       |> extra_cond.()
    else
      false
    end
  end
end
