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

  it "should not allow years outside of 1-9999" do
    ["a",0,10000].each do |y|
      -> {
        FiscalDate.new(y, 1)
      }.must_raise(FiscalDate::InvalidYear)
    end
  end

  describe "#to_s" do
    it "should return Q<quarter> YYYY format" do
      fiscal_date.to_s.must_equal "Q1 2012"
    end
  end
end
