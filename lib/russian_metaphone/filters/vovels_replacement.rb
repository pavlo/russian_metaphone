# encoding: UTF-8
module RussianMetaphone
  module VovelReplacement

    REPLACEMENTS = {/[оыя]/ => "а", /[ю]/ => "y", /[еёэ]/ => "и" }

    def filter(string, options = {})
      result = String.new(string)
      REPLACEMENTS.each_pair do |reg, char|
        result.gsub!(reg, char)
      end
      result
    end
    module_function :filter

  end
end

# Исходные символы  |  Конечный символ
#                   |
#  О, Ы, А, Я       |        А
#  Ю, У             |        У
#  Е, Ё, Э, И       |        И
