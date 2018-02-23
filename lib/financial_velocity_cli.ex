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
    IO.puts "Your initial amount is #{format_amount(principal(opts))}"
    IO.puts "Your assumed percentage growth is #{percent(opts) * 100.0}"
    IO.puts "Your assumed monthly savings is #{format_amount(saving(opts))}"
    IO.puts "==============="
    IO.puts "Your final amount after #{years(opts)} year(s) will be:"
    amount =
      FinancialVelocity.calculate(principal(opts), percent(opts), saving(opts), years(opts))
      |> format_amount
    IO.puts amount
  end

  defp principal(opts), do: opts |> Keyword.get(:principal, 500.0e3)
  defp percent(opts), do: opts |> Keyword.get(:percent, 0.1)
  defp saving(opts), do: opts |> Keyword.get(:saving, 3000.0)
  defp years(opts), do: opts |> Keyword.get(:years, 1)
  defp format_amount(amount) do
    # source: https://stackoverflow.com/questions/43536481/how-to-format-a-number-to-precision-in-elixir
    "$" <> (:io_lib.format("~.2f", [amount]) |> IO.iodata_to_binary)
  end
end
