require 'date'
require 'fiscal_date/comparable_ext'
require 'fiscal_date/arithmetic_ext'
require 'fiscal_date/date_ext'

class FiscalDate
  include ComparableExt
  include ArithmeticExt
  include DateExt

  class InvalidQuarter < StandardError; end
  class InvalidYear < StandardError; end

  attr_reader :year, :quarter

  VALID_QUARTERS = (1..4)
  VALID_YEARS = { min: 1, max: 9999 }

  def initialize(year, quarter)
    @year, @quarter = year.to_i, quarter.to_i
    raise(InvalidQuarter, "`#{quarter}` is not a valid quarter") unless VALID_QUARTERS.include?(@quarter)
    raise(InvalidYear, "`#{year}` is not a valid year") unless VALID_YEARS[:min] < @year && VALID_YEARS[:max] > @year
  end

  def to_s
    "Q#{quarter.to_s} #{year.to_s}"
  end

  alias_method :eql?, :==

  def hash
    to_s.hash
  end

end
