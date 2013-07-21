# encoding: UTF-8
require 'spec_helper'

#
# Исходные символы  |  Конечный символ
#                   |
#  О, Ы, А, Я       |        А
#  Ю, У             |        У
#  Е, Ё, Э, И       |        И
#

describe "Vovels Replacements Filter" do
  
  describe "Default setup should not take into account the accent of a word" do
    RussianMetaphone::VovelReplacement.filter('боян').should == 'баан'
    RussianMetaphone::VovelReplacement.filter('малюкиёлка').should == 'малyкиилка'
  end

end

