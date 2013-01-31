require 'spec_helper'

describe Categoryz3 do
  
  it "should have a config reader" do
    Categoryz3.config.should be_a Categoryz3::Config
  end

  it "should not have a config accessor" do
    lambda { Categoryz3.config = "lol" }.should raise_error
  end

  describe "#setup" do
    it "should yield the block with the new config" do
      Categoryz3.setup do |config|
        config.category_class = "MyCategoryModel"
      end

      Categoryz3.config.category_class.should == "MyCategoryModel"
    end
    # to not mess other tests up
    after { Categoryz3.setup {} }
  end
end
