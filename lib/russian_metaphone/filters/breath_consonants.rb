# encoding: UTF-8
module RussianMetaphone
  # Оглушение согласных в слабой позиции
  module BreathConsonants

    REZONANTS = %w(л м н р) # Сонорные согласные (те звонкие, у которых нет глухой пары?) 
    VOICED_VS_VOICELESS = { 'б' => 'п', 'в' => 'ф', 'г' => 'к', 'д' => 'т', 'ж' => 'ж', 'з' => 'с' }
    VOICED = VOICED_VS_VOICELESS.keys
    VOICELESS = VOICED_VS_VOICELESS.values

    def filter(string, options = {})
      options[:skip_if_before_rezonant] = false if !options.has_key?(:skip_if_before_rezonant)
      previous_char = nil

      string.each_char.each_with_index do |current_char, ind|
        if VOICED.include?(previous_char) && 
          (
             VOICELESS.include?(current_char) || 
             (!options[:skip_if_before_rezonant] && REZONANTS.include?(current_char))
          )
          string[ind-1] = VOICED_VS_VOICELESS[previous_char]
        end
        previous_char = current_char
      end

      # Звонкие согласные превращаются в глухие в конце слова
      string[string.length-1] = VOICED_VS_VOICELESS[previous_char] if VOICED.include?(previous_char)

      string
    end
    module_function :filter

  end
end

# Слабой считается такая позиция (место в слове) звука, 
# при которой он слышится неясно, неотчётливо. 
#
# Такими позициями для согласных звуков являются 
# 1) расположение согласного звука в конце слова: дуб [дуп], верблюд [вирблют]; 
# 2) расположение согласного звука перед другим согласным (кроме сонорных) - 
#     при так называемом стечении согласных, когда их несколько в слове: 
#     пробка [пропка], скобка [скопка];
