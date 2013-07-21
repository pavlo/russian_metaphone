# encoding: UTF-8
module RussianMetaphone
  module Normalization

    def filter(string, options = {})
      Unicode.downcase(string.gsub(/\P{Cyrillic}+/, ''))
    end

    module_function :filter
  end
end
