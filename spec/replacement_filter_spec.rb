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
    RussianMetaphone::Filter::Replacement.filter('боян').should == 'баан'
    RussianMetaphone::Filter::Replacement.filter('малюкиёлка').should == 'малyкиилка'
  end

  it "should replace ЙО, ИО, ЙЕ, ИЕ = И" do
    RussianMetaphone::Filter::Replacement.filter('майонез').should == 'маиниз'
    RussianMetaphone::Filter::Replacement.filter('физиотерапия').should == 'физитирапиа'
    RussianMetaphone::Filter::Replacement.filter('йемен').should == 'имин'
    RussianMetaphone::Filter::Replacement.filter('приключение').should == 'приклyчини'
  end

  it "should replace ТС, ДС = Ц" do
    RussianMetaphone::Filter::Replacement.filter('безрассудство').should == 'бизрассуцтва'
    RussianMetaphone::Filter::Replacement.filter('детсад').should == 'дицад'
  end

  it "should replace Ukrainian characters" do
    RussianMetaphone::Filter::Replacement.filter('місто').should == 'миста'
    RussianMetaphone::Filter::Replacement.filter('переїзд').should == 'пириизд'
    RussianMetaphone::Filter::Replacement.filter('підприємство').should == 'пидпримства'
  end
end

