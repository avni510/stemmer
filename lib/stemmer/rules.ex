defmodule Stemmer.Rules do
  @vowel_regex "([aeiou]|(?<=.)(?<![aeiou])y)"
  @consonant_regex "([^aeiou]|(?<!.)(?=[aeiou])y)"

  def has_vowel?(word) do
    String.match?(word, ~r/#{@vowel_regex}/)
  end

  def vc_count(word) do
    ~r/#{@vowel_regex}#{@consonant_regex}/
    |> Regex.scan(word)
    |> length()
  end

  def ends_with_consonants?(word) do
    String.at(word, -1) == String.at(word, -2) &&
    String.match?(word, ~r/#{@consonant_regex}#{@consonant_regex}$/)
  end

  def ends_with_cvc?(word) do
    not String.ends_with?(word, "w") &&
    not String.ends_with?(word, "x") &&
    not String.ends_with?(word, "y") &&
    String.match?(word, ~r/#{@consonant_regex}#{@vowel_regex}#{@consonant_regex}$/)
  end
end
