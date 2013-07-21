# encoding: UTF-8
module RussianMetaphone
  module LastnameEnding

    REPLACEMENTS = { 
      /овский$/               => '%1',
      /евский$/               => '%2',
      /овская$/               => '%3',
      /евская$/               => '%4',
      /иева$|еева$|ова$|ева$/ => '%5',
      /иев$|еев$|ов$|ев$/     => '%6',
      /нко$/                  => '%7',
      /ая$/                   => '%8',
      /ий$|ый$/               => '%9',
      /ых$|их$/               => '%10',
      /ин$/                   => '%11',
      /ик$|ек$/               => '%12',
      /ук$|юк$/               => '%13'
    }

    def filter(string, options = {})
      REPLACEMENTS.each_pair do |regexp, substitution|
        string.gsub!(regexp, substitution)
      end
      string
    end

    module_function :filter
  end
end
