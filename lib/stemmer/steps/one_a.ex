defmodule Stemmer.Steps.OneA do
  alias Stemmer.Replacement
  alias Stemmer.Conditions

  def replacements, do: [
    %Replacement{
      condition: &Conditions.default(&1, &2), 
      suffix: "sses",
      new_suffix: "ss"
    },
    %Replacement{
      condition: &Conditions.default(&1, &2), 
      suffix: "ies",
      new_suffix: "i"
    },
    %Replacement{
      condition: &Conditions.default(&1, &2), 
      suffix: "ss",
      new_suffix: "ss"
    },
    %Replacement{
      condition: &Conditions.default(&1, &2), 
      suffix: "s",
      new_suffix: ""
    }
  ]

  def execute(word) do
    default = %Replacement{
      condition: nil,
      suffix: "",
      new_suffix: ""
    }

    %{suffix: suffix, new_suffix: new_suffix} = Enum.find(
      replacements(), 
      default, 
      fn %{condition: condition, suffix: suffix} -> 
        condition.(word, suffix) 
      end
    )

    String.replace_suffix(word, suffix, new_suffix) 
  end
end
