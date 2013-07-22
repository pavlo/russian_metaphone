# encoding: UTF-8
require 'spec_helper'

#
# Исходные символы  |  Конечный символ
#                   |
#  О, Ы, А, Я       |        А
#  Ю, У             |        У
#  Е, Ё, Э, И       |        И
#
#  ЙО, ИО, ЙЕ, ИЕ заменяются на И
#  ТС, ДС заменяются на Ц

describe "Replacements Filter" do
  
  it "should not take into account the accent of a word" do
    RussianMetaphone::Replacement.filter('боян').should == 'баан'
    RussianMetaphone::Replacement.filter('малюкиёлка').should == 'малyкиилка'
  end

  it "should replace ЙО, ИО, ЙЕ, ИЕ = И" do
    RussianMetaphone::Replacement.filter('майонез').should == 'маиниз'
    RussianMetaphone::Replacement.filter('физиотерапия').should == 'физитирапиа'
    RussianMetaphone::Replacement.filter('йемен').should == 'имин'
    RussianMetaphone::Replacement.filter('приключение').should == 'приклyчини'
  end

  it "should replace ТС, ДС = Ц" do
    RussianMetaphone::Replacement.filter('безрассудство').should == 'бизрассуцтва'
    RussianMetaphone::Replacement.filter('детсад').should == 'дицад'
  end
end

