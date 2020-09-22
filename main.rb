# encoding: utf-8
#
# Программа-магазин книг и фильмов. Версия 0.1 — заготовка.
#
# (с) goodprogrammer.ru

require_relative './lib/product'
require_relative './lib/book'
require_relative './lib/film'
require_relative './lib/disk'
require_relative './lib/shop'
# Подключаем класс ProductCollection
require_relative './lib/product_collection'

# Создаем коллекцию продуктов, передавая методу класса from_dir путь к папке
# с подпапками films и books. ProductCollection сам знает, как там внутри лежат
# эти файлы и сам разбереться, как их оттуда считать.
collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

# Сортируем продукты по возрастанию цены с помощью метода sort! экземпляра
# класса ProductCollection
collection.sort!(by: :amount, order: :asc)

shop = Shop.new(collection)

loop do
  puts "Что хотите купить:"
  shop.price_list
  puts "0. Выход"
  user_input = STDIN.gets.to_i - 1
  break if user_input == -1
  puts "\nВы выбрали: #{shop.buy_product(user_input)}"
  puts "\nВсего товаров на сумму - #{shop.sum_price}\n\n"
end

puts "Вы купили:\n\n"
puts shop.purchases
puts "\nС Вас - #{shop.sum_price} руб. Спасибо за покупку!"
