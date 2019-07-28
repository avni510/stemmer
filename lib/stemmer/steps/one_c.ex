defmodule Stemmer.Steps.OneC do
  alias Stemmer.Replacement
  alias Stemmer.Conditions

  def replacements, do: [
    %Replacement{
      condition: &Conditions.vowel_exists(&1, &2), 
      suffix: "y",
      new_suffix: "i"
    },
  ]

  def execute(word) do
    %{suffix: suffix, new_suffix: new_suffix} = Enum.find(
      replacements(), 
      Replacement.default, 
      fn %{condition: condition, suffix: suffix} -> 
        condition.(word, suffix) 
      end
    )
    
    String.replace_suffix(word, suffix, new_suffix) 
  end
end
