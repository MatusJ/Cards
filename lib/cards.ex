defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Returns shuffled deck like in classic playing cards game
  """
  def shuffle(deck) do
    deck |> Enum.shuffle
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, hand) do
    deck |> Enum.member?(hand)
  end

  @doc """
    Divides a deck into a hand and the reminder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand
    
  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    deck |> Enum.split(hand_size) 
  end

  def save(deck, filename) do
    binary = deck |> :erlang.term_to_binary
    filename |> File.write(binary)
  end

  def load(filename) do
    case filename |> File.read do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck |> shuffle |> deal(hand_size) 
  end
end
