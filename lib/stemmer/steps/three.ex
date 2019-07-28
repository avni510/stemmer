defmodule Stemmer.Steps.Three do
  alias Stemmer.Replacement
  alias Stemmer.Conditions

  def replacements, do: [
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "icate",
      new_suffix: "ic"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ative",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "alize",
      new_suffix: "al"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "iciti",
      new_suffix: "ic"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ical",
      new_suffix: "ic"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ful",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ness",
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
