defmodule FinancialVelocityTest do
  use ExUnit.Case

  test "compute at the end of 1 year how much you will have" do
    assert FinancialVelocity.calculate(100000.0, 0.10, 2000.0, 1) == 134000.00
  end

  test "compute at the end of 5 years how much you will have" do
    assert FinancialVelocity.calculate(100000.0, 0.10, 2000.0, 5) == 307573.40
  end
end
