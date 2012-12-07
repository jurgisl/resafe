require 'spec_helper'

describe Password do
  subject {FactoryGirl.build :password}
  
  describe "#generate_keywords" do
    
    subject { FactoryGirl.build :password, 
      :name => "password name", 
      :description => "description words are here",
      :category => FactoryGirl.build(:category, :name => "category name") }
    
    it "should return keywords array" do
      subject.generate_keywords.should be_a_kind_of Array
    end
    
    it "should return category name" do
      subject.generate_keywords.should include "category name"
    end
    
    it "should return password name" do
      subject.generate_keywords.should include "password name"
    end
    
    it "should return description tokens" do 
      subject.generate_keywords.should include "description"
      subject.generate_keywords.should include "words"
      subject.generate_keywords.should include "are"
      subject.generate_keywords.should include "here"
    end
  end
  
  describe "#save_keywords" do
    
    it "should delete all keywords" do
      words = []
      subject.stub(:keywords).and_return(words)
      words.should_receive :clear
      subject.save_keywords
    end
    
    it "should call generate_keywords" do
      subject.should_receive(:generate_keywords).and_return []
      subject.save_keywords
    end
    
    it "should create new keywords" do
      subject.save_keywords
      subject.keywords.collect{|k| k.keyword}.should == subject.generate_keywords
    end
    
    it "should not create dublicates" do
      Keyword.create :keyword => subject.name
      subject.save_keywords
      Keyword.where(:keyword => subject.name).count.should == 1
    end
  end
  
  describe "#search" do
    subject { FactoryGirl.create :password, 
      :name => "password name", 
      :description => "description words are here",
      :category => FactoryGirl.create(:category, :name => "category name") }
      
    it "should return array of passwords by name" do
      Password.search("password name").should == [subject]
    end
  end
  
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
