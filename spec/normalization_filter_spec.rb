# encoding: UTF-8
require 'spec_helper'

describe "Normalization Filter" do

  it "should join multiple words into one" do
    RussianMetaphone::Filter::Normalization.filter("привет от старых штиблет").should == 'приветотстарыхштиблет'
  end

  it "should not allow anything but cyrillic chars" do
    RussianMetaphone::Filter::Normalization.filter("Привет мир! Hello World!").should == 'приветмир'
  end

  it "should downcase things properly" do
    source = "МИРу МИр"
    RussianMetaphone::Filter::Normalization.filter("МИРу МИр").should == 'мирумир'
  end

  it "should stip Ь and Ъ chars" do
    RussianMetaphone::Filter::Normalization.filter("масянька").should == 'масянка'
    RussianMetaphone::Filter::Normalization.filter("гундосъев").should == 'гундосев'
  end

end
