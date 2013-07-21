# encoding: UTF-8
require 'spec_helper'

describe "Breath Consonants Filter" do
  
  it "should replace voiced with voiceless counterpart if voiced goes right before a voiceless" do
    RussianMetaphone::BreathConsonants.filter('мавка').should == 'мафка'
    RussianMetaphone::BreathConsonants.filter('обнимать').should == 'опнимать'
    RussianMetaphone::BreathConsonants.filter('втгжбсаук').should == 'фткжпсаук'
  end

  it "skip_if_before_rezonant option is TRUE" do
    # если 'Б' идет перед сонорным 'Н', тогда его не заменяем, если передан skip_if_before_rezonant 
    RussianMetaphone::BreathConsonants.filter('обнимать', :skip_if_before_rezonant => true).should == 'обнимать'
  end

  it "should replace voiced conconant with voiceless at the end of the word" do
    RussianMetaphone::BreathConsonants.filter('город').should == 'горот'
    RussianMetaphone::BreathConsonants.filter('мороз').should == 'морос'
  end

end

