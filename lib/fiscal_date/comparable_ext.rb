class FiscalDate
  module ComparableExt

    def self.included(base)
      base.send(:include, Comparable)
    end

    def <=>(fd)
      if year < fd.year || (year == fd.year && quarter < fd.quarter)
        -1
      elsif year > fd.year || (year == fd.year && quarter > fd.quarter)
        1
      else
        0
      end
    end
  end
end
