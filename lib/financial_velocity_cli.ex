defmodule FinancialVelocity.Cli do
  def main(args) do
    args
    |> parse_options
    |> output_report
  end

  defp parse_options(args) do
    {options, _args}  = OptionParser.parse!(args,
    switches: [principal: :float, percent: :float, saving: :float,
      years: :integer]
    )
    options
  end

  defp output_report(opts) do
  end
end
