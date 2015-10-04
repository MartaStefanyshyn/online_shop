require 'rails_helper'

describe Category, :type => :model  do
  it "should create valid category" do
    expect(FactoryGirl.create(:category)).to be_valid
  end
  
  it "is invalid without a title" do
    expect(FactoryGirl.build(:category, title: nil)).to_not be_valid
  end
  
  it "categorylist is empty" do
    expect(Category.count).to eq 0
  end
end