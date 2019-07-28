# Stemmer

This program stems a word according to the [Porter Stemmer Algorithm](https://tartarus.org/martin/PorterStemmer/def.txt)

The inconsistencies of the porter stemmer algorithm have not been addressed in this program. Updates have been made
to the original algorithm [here](https://snowballstem.org/algorithms/english/stemmer.html). But these are not addressed in
this program.

## Requirements
* `elixir` ~> 1.8

## Tests
* Run tests with `mix test`

## Usage
`Stemmer.run/1` takes in  a word, string of words, or list of words.

```
iex> Stemmer.run("feudalism")
"feudal"
iex> Stemmer.run("feudalism callousness")
"feudal callous"
iex> Stemmer.run(["feudalism", "callousness"])
["feudal", "callous"]
```

