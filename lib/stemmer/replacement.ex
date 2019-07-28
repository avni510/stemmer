defmodule Stemmer.Replacement do
  defstruct condition: nil, suffix: nil, new_suffix: nil

  def default, do:
    %__MODULE__{
      condition: nil,
      suffix: "",
      new_suffix: ""
    }
end
