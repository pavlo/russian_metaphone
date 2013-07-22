# encoding: UTF-8
module RussianMetaphone
  module Filter
    module Normalization

      STRIP_REGEXP = /[ъь]/ 

      def filter(string, options = {})
        string = Unicode.downcase(string.gsub(/\P{Cyrillic}+/, ''))
        string.gsub(STRIP_REGEXP, '')
      end

      module_function :filter
    end
  end
end
