defmodule Stemmer.Steps.OneB do
  alias Stemmer.Replacement
  alias Stemmer.Conditions

  def replacements, do: [
    %Replacement{
      condition: &Conditions.vc_greater_zero(&1, &2), 
      suffix: "eed",
      new_suffix: "ee"
    },
    %Replacement{
      condition: &Conditions.vowel_exists(&1, &2), 
      suffix: "ed",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vowel_exists(&1, &2), 
      suffix: "ing",
      new_suffix: ""
    }
  ]

  def post_replacements, do: [
    %Replacement{
      condition: &Conditions.default(&1, &2), 
      suffix: "at",
      new_suffix: "ate"
    },
    %Replacement{
      condition: &Conditions.default(&1, &2), 
      suffix: "bl",
      new_suffix: "ble"
    },
    %Replacement{
      condition: &Conditions.default(&1, &2), 
      suffix: "iz",
      new_suffix: "ize"
    },
    %Replacement{
      condition: &Conditions.double_consonant_ending(&1, &2), 
      suffix: "",
      new_suffix: ""
    },
    %Replacement{
      condition: &Conditions.vc_one_ends_with_cvc(&1, &2), 
      suffix: "",
      new_suffix: "e"
    }
  ]

  def execute(word) do
    replacements()
    |> Enum.find_index(
      fn %{condition: condition, suffix: suffix} -> 
        condition.(word, suffix) 
      end
    )
    |> case do
      0 ->
        replace_old_suffix(word, replacements(), 0)

      i when i == 1 or i == 2 -> 
        word
        |> replace_old_suffix(replacements(), i)
        |> secondary_steps

      _ -> word
    end
  end

  defp secondary_steps(word) do
    post_replacements()
    |> Enum.find_index(
      fn %{condition: condition, suffix: suffix} -> 
        condition.(word, suffix) 
      end
    )
    |> case do
      nil -> word
      3 -> String.slice(word, 0..-2) 
      index -> 
        replace_old_suffix(word, post_replacements(), index)
    end
  end

  defp replace_old_suffix(word, replacements, index) do
    %{suffix: suffix, new_suffix: new_suffix} = 
      Enum.at(replacements, index)

    String.replace_suffix(word, suffix, new_suffix) 
  end
end
