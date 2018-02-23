defmodule FinancialVelocity do
  @moduledoc """
  Documentation for FinancialVelocity.
  """

  @doc """
  Compute your year over year gains
  """
  @spec calculate(float(), float(), float(), integer()) :: float()
  def calculate(initial_amount, percent, monthly_savings, 0),
    do: initial_amount |> Float.round(2)
  def calculate(initial_amount, percent, monthly_savings, years) do
    (initial_amount * (percent + 1.0) + monthly_savings * 12)
    |> calculate(percent, monthly_savings, years - 1)
  end
end
