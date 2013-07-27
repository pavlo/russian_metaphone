# encoding: UTF-8

#  ТС, ДС           |        Ц
#  І, Ї             |        И
#  Є                |        Е
#  ЙО, ИО, ЙЕ, ИЕ   |        И
#  О, Ы, А, Я       |        А
#  Ю, У             |        У
#  Е, Ё, Э, И       |        И
module RussianMetaphone
  module Filter
    module Replacement

      REPLACEMENTS = { 
        /тс|дс/       => 'ц' , 
        /[їі]/        => 'и' , 
        /[є]/         => 'е' , 
        /йо|ио|йе|ие/ => 'и', 
        /[оыя]/       => 'а', 
        /[ю]/         => 'y', 
        /[еёэ]/       => 'и' 
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
