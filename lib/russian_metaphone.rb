# encoding: UTF-8
require "unicode"
require "russian_metaphone/version"
require "russian_metaphone/filter"

module RussianMetaphone
  def process(source)
    filters = [
      RussianMetaphone::Filter::Normalization,
      RussianMetaphone::Filter::DuplicatesRemoval,
      RussianMetaphone::Filter::LastnameEnding,
      RussianMetaphone::Filter::Replacement,
      RussianMetaphone::Filter::BreathConsonants,
      RussianMetaphone::Filter::DuplicatesRemoval
    ]
    result = String.new(source)
    filters.each { |f| result = f.send(:filter, result) }
    result
  end
  module_function :process
end
