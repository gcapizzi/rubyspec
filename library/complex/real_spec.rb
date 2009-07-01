require File.dirname(__FILE__) + '/../../spec_helper'

ruby_version_is ""..."1.9" do
  
  require 'complex'

  describe "Complex#real" do
    it "returns the real part of self" do
      Complex(1, 0).real.should == 1
      Complex(2, 1).real.should == 2
      Complex(6.7, 8.9).real.should == 6.7
      Complex(bignum_value, 3).real.should == bignum_value
    end
  end
end
