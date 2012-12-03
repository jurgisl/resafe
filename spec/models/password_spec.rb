require 'spec_helper'

describe Password do
  describe "#all_by_category" do
    before :each do
      @category_parent = FactoryGirl.create :category
      @category_child = FactoryGirl.create :category, :parent => @category_parent
      @password_parent = FactoryGirl.create :password, :category => @category_parent
      @password_child = FactoryGirl.create :password, :category => @category_child
    end
    
    it "should filter passwords by category" do
      Password.all_by_category(@category_parent.id).should == [@password_parent]
    end
  end
end
