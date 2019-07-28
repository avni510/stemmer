defmodule Stemmer do
  alias Stemmer.Steps.{
    OneA,
    OneB,
    OneC,
    Two,
    Three,
    Four,
    FiveA,
    FiveB
  }

  def run(words) when is_list(words) do
    Enum.map(words, &do_run(&1))
  end

  def run(words) do
    words
    |> String.split()
    |> run
    |> Enum.join(" ")
  end

  defp do_run(word) do
    updated_word = 
      word
      |> String.replace(~r/[[:punct:]]/, "")
      |> String.downcase
    
    if String.length(updated_word) <= 2 do
      updated_word
    else
      stem(updated_word)
    end
  end

  defp stem(word) do
    word
    |> OneA.execute()
    |> OneB.execute()
    |> OneC.execute()
    |> Two.execute()
    |> Three.execute()
    |> Four.execute()
    |> FiveA.execute()
    |> FiveB.execute()
  end
end
