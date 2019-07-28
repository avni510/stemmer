defmodule Stemmer.Steps.FiveB do
  alias Stemmer.Replacement
  alias Stemmer.Conditions

  def replacements, do: [
    %Replacement{
      condition: &Conditions.vc_greater_one_double_consonant(&1, &2), 
      suffix: "",
      new_suffix: ""
    },
  ]

  def execute(word) do
    replacements()
    |> Enum.find_index(
      fn %{condition: condition, suffix: suffix} -> 
        condition.(word, suffix) 
      end
    )
    |> case do
      nil -> word
      _ -> String.slice(word, 0..-2)
    end
  end
end
