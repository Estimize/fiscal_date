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
  end

  describe "#+" do
    it "should be spec'd"
  end
end
