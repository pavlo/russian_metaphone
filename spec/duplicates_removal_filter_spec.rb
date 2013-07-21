# encoding: UTF-8
require 'spec_helper'

describe "Duplicates Removal Filter" do
  
  it "should remove all duplicates" do
    RussianMetaphone::DuplicatesRemoval.filter('Метревелли').should == 'Метревели'
    RussianMetaphone::DuplicatesRemoval.filter('Длиннющий').should == 'Длинющий'
  end
  
  it "should not do anything if no duplicates available" do
    RussianMetaphone::DuplicatesRemoval.filter('новый год').should == 'новый год'
  end

end

