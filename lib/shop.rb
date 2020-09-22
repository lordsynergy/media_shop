class Shop
  def initialize(products)
    @basket = []
    @products = products
    @sum_price = 0
  end

  def price_list
    puts "Что хотите купить:"
    @products.to_a.each_with_index { |product, index| puts "#{index + 1}. #{product}" }
    puts "0. Выход"
  end

  def buy_product(user_input)
    check_input(user_input)
    product = @products.to_a[@user_input]
    return puts "\nЭтот товар закончился." if product.amount.to_i < 1
    product.update(amount: product.amount.to_i - 1)
    @basket << product
    @sum_price += product.price.to_i
    puts "\nВы выбрали: #{product}"
    puts "\nВсего товаров на сумму - #{@sum_price}\n\n"
  end

  def check_input(user_input)
    @user_input = user_input
    until @user_input < @products.to_a.size
      puts "Такого товара нет. Выберите другой."
      @user_input = STDIN.gets.to_i - 1
    end
    return @user_input
  end

  def to_s
    puts "Вы купили:\n\n"
    @basket.each { |product| puts product }
    puts "\nС Вас - #{@sum_price} руб. Спасибо за покупку!"
  end
end