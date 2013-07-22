# encoding: UTF-8
require 'spec_helper'

#
# Исходные символы  |  Конечный символ
#                   |
#  О, Ы, А, Я       |        А
#  Ю, У             |        У
#  Е, Ё, Э, И       |        И
#
# А также: ЙО, ИО, ЙЕ, ИЕ заменяются на И

describe "Vovels Replacements Filter" do
  
  it "should not take into account the accent of a word" do
    RussianMetaphone::VovelReplacement.filter('боян').should == 'баан'
    RussianMetaphone::VovelReplacement.filter('малюкиёлка').should == 'малyкиилка'
  end

  it "should replace ЙО, ИО, ЙЕ, ИЕ = И" do
    RussianMetaphone::VovelReplacement.filter('майонез').should == 'маиниз'
    RussianMetaphone::VovelReplacement.filter('физиотерапия').should == 'физитирапиа'
    RussianMetaphone::VovelReplacement.filter('йемен').should == 'имин'
    RussianMetaphone::VovelReplacement.filter('приключение').should == 'приклyчини'
  end

end

