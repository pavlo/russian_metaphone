# encoding: UTF-8
require 'spec_helper'

describe "Lastname Ending Filter" do
  
  it "should collapse like this:" do
    assert_filter('Дубровский', 'Дубр%1')
    assert_filter('Раевский', 'Ра%2')
    assert_filter('Покровская', 'Покр%3')
    assert_filter('Раневская', 'Ран%4')

    assert_filter('Палиева', 'Пал%5')
    assert_filter('Авдеева', 'Авд%5')
    assert_filter('Семенова', 'Семен%5')
    assert_filter('Терентьева', 'Теренть%5')

    assert_filter('Палиев', 'Пал%6')
    assert_filter('Авдеев', 'Авд%6')
    assert_filter('Семенов', 'Семен%6')
    assert_filter('Терентьев', 'Теренть%6')

    assert_filter('Кононенко', 'Кононе%7')

    assert_filter('Яровая', 'Яров%8')

    assert_filter('Чернявский', 'Чернявск%9')
    assert_filter('Буденый', 'Буден%9')

    assert_filter('Боровских', 'Боровск%10')
    assert_filter('Черных', 'Черн%10')

    assert_filter('Литвин', 'Литв%11')

    assert_filter('Кулик', 'Кул%12')
    assert_filter('Гашек', 'Гаш%12')

    assert_filter('Гайдук', 'Гайд%13')
    assert_filter('Мазнюк', 'Мазн%13')
  end
  
end

def assert_filter(source, expected)
  RussianMetaphone::Filter::LastnameEnding.filter(source).should == expected
end

