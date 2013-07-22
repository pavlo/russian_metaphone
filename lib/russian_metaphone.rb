# encoding: UTF-8
require "unicode"
require "russian_metaphone/version"
require "russian_metaphone/filter"

module RussianMetaphone
  def process(source)
    filters = [
      RussianMetaphone::Normalization,
      RussianMetaphone::DuplicatesRemoval,
      RussianMetaphone::LastnameEnding,
      RussianMetaphone::Replacement,
      RussianMetaphone::BreathConsonants,
      RussianMetaphone::DuplicatesRemoval
    ]
    result = String.new(source)
    filters.each { |f| result = f.send(:filter, result) }
    result
  end
  module_function :process
end
