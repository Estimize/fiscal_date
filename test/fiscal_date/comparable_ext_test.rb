require_relative '../test_helper'

describe FiscalDate do
  describe "#<=>" do
    it "should return -1 when less than (same years)" do
      (FiscalDate.new(2012,2) <=> FiscalDate.new(2012,3)).must_equal -1
    end

    it "should return -1 when less than (different years)" do
      (FiscalDate.new(2011,4) <=> FiscalDate.new(2012,3)).must_equal -1
    end

    it "should return 0 when equal" do
      (FiscalDate.new(2012,3) <=> FiscalDate.new(2012,3)).must_equal 0
    end

    it "should return 1 when greater than (same years)" do
      (FiscalDate.new(2012,4) <=> FiscalDate.new(2012,3)).must_equal 1
    end

    it "should return 1 when greater than (different years)" do
      (FiscalDate.new(2013,1) <=> FiscalDate.new(2012,3)).must_equal 1
    end
  end
end
