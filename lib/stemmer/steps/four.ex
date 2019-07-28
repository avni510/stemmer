defmodule Stemmer.Steps.Four do
  alias Stemmer.Replacement
  alias Stemmer.Conditions

  def replacements, do: [
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "al",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ance",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ence",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "er",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ic",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "able",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ible",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ant",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ement",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ment",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ent",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one_ends_with_st(&1, &2), 
      suffix: "ion",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ou",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ism",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ate",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "iti",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ous",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ive",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_greater_one(&1, &2), 
      suffix: "ize",
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
