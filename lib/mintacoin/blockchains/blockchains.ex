defmodule Mintacoin.Blockchains do
  @moduledoc """
  This module is the responsible for the CRUD operations for blockchains and also for the aggreate operations within the blockchain context.
  """

  alias Ecto.Changeset
  alias Mintacoin.{Blockchain, Repo}

  @type name :: String.t() | atom()
  @type network :: String.t() | atom()
  @type changes :: map()
  @type error :: Changeset.t()
  @type blockchain :: Blockchain.t() | nil

  @spec create(changes :: changes()) :: {:ok, Blockchain.t()} | {:error, error()}
  def create(changes) do
    %Blockchain{}
    |> Blockchain.changeset(changes)
    |> Repo.insert()
  end

  @spec retrieve(name :: name(), network :: network()) :: {:ok, blockchain()}
  def retrieve(name, network \\ :mainnet)
  def retrieve(name, network), do: {:ok, Repo.get_by(Blockchain, name: name, network: network)}
end
