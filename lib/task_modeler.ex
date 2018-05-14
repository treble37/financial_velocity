defmodule FinancialVelocity.TaskModeler do
  @moduledoc """
  Use tasks to compute multiple annual return scenarios using uniformly
  distributed rates of return
  """

  alias FinancialVelocity.UniformSampler

  # FinancialVelocity.TaskModeler.generate_report(500.0e3, 3000, 5, 10000)
  def generate_report(initial_amount, monthly_savings, years, sample_size \\ 10000) do
    returns = compute_simulated_returns(initial_amount, monthly_savings, years, sample_size)
    avg = returns |> compute_average_return
    max = Enum.max(returns)
    min = Enum.min(returns)
    IO.puts "Your worst return was #{min}"
    IO.puts "Your best return was #{max}"
    IO.puts "Your average return was #{avg}"
  end

  def compute_average_return(returns) do
    returns
    |> Enum.sum
    |> Kernel./(length(returns))
  end

  # FinancialVelocity.TaskModeler.compute_simulated_returns(500.0e3, 3000, 5, 1000)
  def compute_simulated_returns(initial_amount, monthly_savings, years, sample_size \\ 10000) do
    (1..sample_size)
    |> Enum.to_list
    |> Task.async_stream(fn(_x) -> FinancialVelocity.calculate(initial_amount, UniformSampler.random_annual_return, monthly_savings, years) end)
    |> Enum.map(&(elem(&1, 1)))
  end
end
