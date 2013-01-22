require_relative 'test_helper'

describe FiscalDate do
  let(:fiscal_date) { FiscalDate.new(2012, 1) }

  it "should have year" do
    fiscal_date.year.must_equal 2012
  end

  it "should have quarter" do
    fiscal_date.quarter.must_equal 1
  end

  it "should not allow quarters other than 1-4" do
    ["a",5,0].each do |q|
      -> {
        FiscalDate.new(2012, q)
      }.must_raise(FiscalDate::InvalidQuarter)
    end
  end

  describe "#to_s" do
    it "should return Q<quarter> YYYY format" do
      fiscal_date.to_s.must_equal "Q1 2012"
    end
  end

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
end
