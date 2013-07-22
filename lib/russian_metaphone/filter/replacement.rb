# encoding: UTF-8

# Исходные символы  |  Конечный символ
#                   |
#  О, Ы, А, Я       |        А
#  Ю, У             |        У
#  Е, Ё, Э, И       |        И
#
#  ЙО, ИО, ЙЕ, ИЕ заменяются на И
#  ТС, ДС заменяются на Ц
#
module RussianMetaphone
  module Filter
    module Replacement

      REPLACEMENTS = { 
        /тс|дс/ => 'ц' , 
        /йо|ио|йе|ие/ => 'и', 
        /[оыя]/ => 'а', 
        /[ю]/ => 'y', 
        /[еёэ]/ => 'и' 
      }

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

end
