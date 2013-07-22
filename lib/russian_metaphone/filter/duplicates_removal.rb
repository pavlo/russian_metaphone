# encoding: UTF-8
module RussianMetaphone
  module Filter
    # Исключение повторяющихся символов
    module DuplicatesRemoval

      def filter(string, options = {})
        previous_char = nil

        string.each_char.each_with_index do |current_char, ind|
          string.slice!(ind-1) if previous_char == current_char
          previous_char = current_char
        end

        string
      end
      module_function :filter

    end
  end
end
