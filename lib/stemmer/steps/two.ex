defmodule Stemmer.Steps.Two do
  alias Stemmer.Replacement
  alias Stemmer.Conditions

  def replacements, do: [
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ational",
      new_suffix: "ate"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "tional",
      new_suffix: "tion"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "enci",
      new_suffix: "ence"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "anci",
      new_suffix: "ance"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "izer",
      new_suffix: "ize"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "abli",
      new_suffix: "able"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "alli",
      new_suffix: "al"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "entli",
      new_suffix: "ent"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "eli",
      new_suffix: "e"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ousli",
      new_suffix: "ous"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ization",
      new_suffix: "ize"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ation",
      new_suffix: "ate"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ator",
      new_suffix: "ate"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "alism",
      new_suffix: "al"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "iveness",
      new_suffix: "ive"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "fulness",
      new_suffix: "ful"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "ousness",
      new_suffix: "ous"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "aliti",
      new_suffix: "al"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "iviti",
      new_suffix: "ive"
    },
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "biliti",
      new_suffix: "ble"
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
