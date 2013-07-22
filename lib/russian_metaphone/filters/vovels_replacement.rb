# encoding: UTF-8

# Исходные символы  |  Конечный символ
#                   |
#  О, Ы, А, Я       |        А
#  Ю, У             |        У
#  Е, Ё, Э, И       |        И
#
# А также: ЙО, ИО, ЙЕ, ИЕ заменяются на И
#
module RussianMetaphone
  module VovelReplacement

    REPLACEMENTS = { /йо|ио|йе|ие/ => 'и', /[оыя]/ => 'а', /[ю]/ => 'y', /[еёэ]/ => 'и' }

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

