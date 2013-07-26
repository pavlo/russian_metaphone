# RussianMetaphone

This gem provides an implementation of 'Metaphone' phonetic algorithm adapted for Russian language. Check [this Wikipedia article](http://rubydoc.info/gems/carrierwave/frames) for Metaphone intro.

## Installation

Add this line to your application's Gemfile:

    gem 'russian_metaphone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install russian_metaphone

## Usage

Going to switch to Russian at this point... Drop me a line if you'd like me to translate the Usage section to English...

Алгоритм русского "Метафон" был предложен Петром Каньковски более 10 лет назад. Именно он и лег в основу этой реализации. Оригинал статьи, за давностью лет, не сохранился, но можно посмотреть его в [архиве](http://web.archive.org/web/20071107145942/http://kankowski.narod.ru/dev/metaphoneru.htm)

Реализация RussianMetaphone ни в коем случае не претендует на высокую производительность. Основной упор сделан на модульность реализации, что позволяет легко менять, настраивать, тестировать и подстраивать его под нужды конкретного проекта. Думаю оптимизация хорошо настроенного алгоритма не будет сложной задачей, гораздо сложнее "оттюнить" сам алгоритм.

### Как пользоваться

```ruby
puts RussianMetaphone::process("Ахматова") # => ахмат%5
puts RussianMetaphone::process("Бродский") # => працк%9
puts RussianMetaphone::process("Мальденштам") # => малдинштам
```

### Как это работает

Входные данные пропускаются через набор фильтров и каждый фильтр по-своему модифицирует строку. Та сторка, которую вернет последний фильтр в цепочку, и будет конечным результатом.

### Фильтры

Фильтр - это руби модуль, который реализует метод *filter*

```ruby
def filter(string, options = {})
```

результатом выполнения фильтра должна быть строка. Ниже перечислены "стандартные" фильтры:

#### RussianMetaphone::Filter::Normalization

Нормализует строку - убирает из нее все не кириллическое, а так-же символы твердого и мягкого знаков ('Ъ' и 'Ь')

#### RussianMetaphone::Filter::DuplicatesRemoval

Исключает повторяющиеся символы - (Метревели многие напишут как Метревелли)

#### RussianMetaphone::Filter::LastnameEnding

При работе с фамилиями бывает полезным заменить часто употребимые окончания фамилий на что-то более короткое. Этот фильтр заменяет окончание *овский* на *%1*, *евский* на *%2* и т.д. Остальные замены см. в исходниках.

#### RussianMetaphone::Filter::Replacement

*todo*

#### RussianMetaphone::Filter::BreathConsonants

*todo*

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
