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

purchase = Shop.new(collection)

loop do
  purchase.price_list
  user_input = STDIN.gets.to_i - 1
  break if user_input == -1
  purchase.buy_product(user_input)
end

puts purchase.to_s
