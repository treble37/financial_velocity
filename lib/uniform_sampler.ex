defmodule FinancialVelocity.UniformSampler do
  alias FinancialVelocity.HistoricalData

  def random_annual_return do
    :rand.seed(:exsplus, :os.timestamp())
    n = length(HistoricalData.sp500_annual_return_list)
    HistoricalData.sp500_annual_return_list
    |> Enum.at(Enum.random(0..n-1))
    |> elem(1)
    |> Kernel./(100.0)
  end
end
