require File.dirname(__FILE__) + '/../../spec_helper'

ruby_version_is ""..."1.9" do

  require 'complex'

  describe "Complex#+ with Complex" do
    it "adds both the real and imaginary components" do
      (Complex(1, 2) + Complex(10, 20)).should == Complex(1 + 10, 2 + 20)
      (Complex(1.5, 2.1) + Complex(100.2, -30.3)).should == Complex(1.5 + 100.2, 2.1 + (-30.3))
    end
  end

  describe "Complex#+ with Integer" do
    it "adds the real number to the real component of self" do
      (Complex(1, 2) + 50).should == Complex(51, 2)
      (Complex(1, 2) + 50.5).should == Complex(51.5, 2)
    end
  end

  describe "Complex#+ with Object" do
    it "tries to coerce self into other" do
      value = Complex(3, 9)
      
      obj = mock("Object")
      obj.should_receive(:coerce).with(value).and_return([2, 5])
      (value + obj).should == 2 + 5
    end
  end
end
