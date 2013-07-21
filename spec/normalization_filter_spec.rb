# encoding: UTF-8
require 'spec_helper'

describe "Normalization Filter" do

  it "should join multiple words into one" do
    source = "привет от старых штиблет"
    RussianMetaphone::Normalization.filter(source).should == 'приветотстарыхштиблет'
  end

  it "should not allow anything but cyrillic chars" do
    source = "Привет мир! Hello World!"
    RussianMetaphone::Normalization.filter(source).should == 'приветмир'
  end

  it "should downcase things properly" do
    source = "МИРу МИр"
    RussianMetaphone::Normalization.filter(source).should == 'мирумир'
  end

end
