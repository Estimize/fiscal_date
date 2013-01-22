require_relative '../test_helper'

describe FiscalDate do
  describe ".from_quarter_date" do
    describe "with default end of fiscal year (December)" do
      it "should return Q4 for same year" do
        FiscalDate.by_quarter_date(Date.new(2012,12,31)).must_equal FiscalDate.new(2012, 4)
      end
      
      it "should return Q1 for same year" do
        FiscalDate.by_quarter_date(Date.new(2012,3,31)).must_equal FiscalDate.new(2012, 1)
      end
    end

    describe "with specified end of fiscal year" do
      it "should return Q4 for same year" do
        FiscalDate.by_quarter_date(Date.new(2012,9,30), 9).must_equal FiscalDate.new(2012, 4)
      end
      
      it "should return Q1 for same year" do
        FiscalDate.by_quarter_date(Date.new(2011,12,31), 9).must_equal FiscalDate.new(2012, 1)
      end

      it "should return Q1 for following year" do
        FiscalDate.by_quarter_date(Date.new(2012,12,31), 9).must_equal FiscalDate.new(2013, 1)
      end
    end

    describe "with bogus calendar" do
      it "should raise InconsistentCalendar" do
        -> {
          FiscalDate.by_quarter_date(Date.new(2012,11,30), 12)
        }.must_raise(FiscalDate::InconsistentCalendar)
      end
    end
  end
end
