defmodule Stemmer.Steps.FiveA do
  alias Stemmer.Replacement
  alias Stemmer.Conditions

  def replacements, do: [
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "e",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_one_not_ends_with_cvc(&1, &2), 
      suffix: "e",
      new_suffix: ""
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
