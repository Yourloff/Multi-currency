TRANSLATIONS = [
  ['ask_rate_euro', 'Какой сейчас курс евро?', 'What is the exchange rate of the additional euro now?'],
  ['ask_rubles', 'Сколько у вас рублей?', 'How many rubles do you have?'],
  ['ask_dollars', 'Сколько у вас долларов?', 'How many dollars do you have?'],
  ['ask_euro', 'Сколько у вас евро?', 'How much money do you have in an additional euro?'],
  ['ask_rate_dollar', 'Какой сейчас курс доллара?', 'What is the dollar exchange rate now?'],
  ['balanced_portfolio', 'Остаётся без изменений', 'Remains unchanged'],
  ['buy', 'Вам нужно купить', 'You need to buy'],
  ['to_sell', 'Вам нужно продать', 'You need to sell'],
]

def translate(phrase, locale)
  index = (locale == 'ru' ? 1 : 2)
  translation = TRANSLATIONS.find { |element| element[0] == phrase }

  translation[index]
end

def calculate_currency(currency, rate, sum)
  difference = (currency - ((sum / 3) / rate)).round(2)

  if difference.abs < 1
    0
  else
    difference
  end
end

def output(currency, locale)
  if currency > 0
    puts "#{translate('to_sell', locale)} #{currency}"
  elsif currency < 0
    puts "#{translate('buy', locale)} #{currency.abs}"
  else
    puts {translate('buy', locale)}
  end
end

puts "Выберите язык для продолжения\n" \
      'Select the language to continue (ru/en)'

locale = gets.chomp

puts translate('ask_rate_euro', locale)
euro_rate = gets.to_f

puts translate('ask_euro', locale)
euro = gets.to_f

puts translate('ask_rate_dollar', locale)
dollar_rate = gets.to_f

puts translate('ask_dollars', locale)
dollar = gets.to_f

puts translate('ask_rubles', locale)
ruble = gets.to_f

dollar_to_ruble = (dollar * dollar_rate)
euro_to_ruble = (euro * euro_rate)

sum = (ruble + dollar_to_ruble + euro_to_ruble).round(2)

output(calculate_currency(dollar, dollar_rate, sum), locale)
output(calculate_currency(euro, euro_rate, sum), locale)
