class FiscalDate
  module ArithmeticExt

    def -(fd_or_integer)
      year_diff = year - fd_or_integer.year
      quarter_diff = quarter - fd_or_integer.quarter
      year_diff * 4 + quarter_diff
    end

    def +(quarters)
      return self if quarters.zero?
      
      years = quarters / 4
      quarters = (quarters % 4) + self.quarter

      # We can use modulo but we'd have to map the quarters 1-4 to 0-3,
      # this seemed easier.
      if quarters > 4
        years += 1
        quarters -= 4
      end

      self.class.new(self.year + years, quarters)
    end

  end
end
