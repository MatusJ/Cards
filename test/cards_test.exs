defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    assert Cards.create_deck |> length == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    #can fail, sometimes deck can remain the same after shuffling
    #assert deck != deck |> Cards.shuffle
    refute deck == deck |> Cards.shuffle
  end
end
