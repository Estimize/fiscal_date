require_relative '../test_helper'

describe FiscalDate do
  describe "#-" do
    describe "when argument is FiscalDate" do
      it "should return the difference in quarters for same year" do
        (FiscalDate.new(2012, 4) - FiscalDate.new(2012, 2)).must_equal 2
      end
      
      it "should return the difference in quarters for different years" do
        (FiscalDate.new(2012, 4) - FiscalDate.new(2010, 3)).must_equal 9
      end
      
      it "should return negative difference when appropriate" do
        (FiscalDate.new(2012, 2) - FiscalDate.new(2012, 4)).must_equal -2
      end
    end

    describe "when argument is integer" do
      it "should subtract quarters and return FiscalDate" do
        (FiscalDate.new(2012,2) - 1).must_equal FiscalDate.new(2012,1)
      end

      it "should roll back to previous year when necessary" do
        (FiscalDate.new(2012,2) - 2).must_equal FiscalDate.new(2011,4)
      end
    end
  end

  describe "#+" do
    it "should add quarters" do
      (FiscalDate.new(2012,2) + 1).must_equal FiscalDate.new(2012,3)
    end

    it "should roll over to next year when necessary" do
      (FiscalDate.new(2012,2) + 3).must_equal FiscalDate.new(2013,1)
    end
  end
end
