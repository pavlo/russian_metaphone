# encoding: UTF-8
require "unicode"
require "russian_metaphone/version"
require "russian_metaphone/filter"

module RussianMetaphone

  # fits well if you search for similar sounded last names / names
  DEFAULT_FILTERS = [
      RussianMetaphone::Filter::Normalization,
      RussianMetaphone::Filter::DuplicatesRemoval,
      RussianMetaphone::Filter::LastnameEnding,
      RussianMetaphone::Filter::Replacement,
      RussianMetaphone::Filter::BreathConsonants,
      RussianMetaphone::Filter::DuplicatesRemoval
    ]


  def process(source, filters = DEFAULT_FILTERS)
    result = String.new(source)
    filters.each { |f| result = f.send(:filter, result) }
    result
  end
  module_function :process
end
