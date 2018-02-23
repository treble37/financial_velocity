# FinancialVelocity

This is a simple little calculator app that calculates year to year how much money you will accumulate based on a certain percentage growth in your investments (e.g., stocks) and how much you save each year.

The formula used to compute annual growth is:

total_amount_at_end_of_year = initial_amount_at_year_start * (1 + percentage_gained) + amount_saved_each_year

Note that it's a rough estimate that I got from a financial book somewhere...

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `financial_velocity` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:financial_velocity, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/financial_velocity](https://hexdocs.pm/financial_velocity).
