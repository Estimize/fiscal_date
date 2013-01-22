require 'fiscal_date/comparable_ext'
require 'fiscal_date/arithmetic_ext'

class FiscalDate
  include ComparableExt
  include ArithmeticExt

  class InvalidQuarter < StandardError; end

  attr_accessor :year, :quarter

  VALID_QUARTERS = (1..4)

  def initialize(year, quarter)
    raise(InvalidQuarter, "`#{quarter}` is not a valid quarter") unless VALID_QUARTERS.include?(quarter)
    self.year, self.quarter = year, quarter
  end

  def to_s
    "Q#{quarter.to_s} #{year.to_s}"
  end

  def self.from_quarter_date(quarter_end_date, year_end_month = 12)
    quarter_end_month = quarter_end_date.month - 1
    year_end_month = year_end_month - 1

    fiscal_year = quarter_end_date.year
    fiscal_quarter = nil

    if year_end_month == quarter_end_month
      fiscal_quarter = 4
    elsif (year_end_month + 3) % 12 == quarter_end_month
      fiscal_quarter = 1
    elsif (year_end_month + 6) % 12 == quarter_end_month
      fiscal_quarter = 2
    elsif (year_end_month + 9) % 12 == quarter_end_month
      fiscal_quarter = 3
    else
      raise("Inconsistent fiscal calendar: quarter ends month #{quarter_end_month} and year ends month #{year_end_month}")
    end

    fiscal_year += 1 if quarter_end_month > year_end_month

    return new(fiscal_year, fiscal_quarter)
  end
end
