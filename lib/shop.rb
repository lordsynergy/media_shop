class Shop
  attr_reader :sum_price

  def initialize(products)
    @basket = {}
    @products = products
    @sum_price = 0
  end

  def price_list
    @products.to_a.each_with_index { |product, index| puts "#{index + 1}. #{product}" }
  end

  def buy_product(user_input)
    check_input(user_input)
    product = @products.to_a[@user_input]
    product.update(amount: product.amount - 1)
    @products.to_a.delete_at(@user_input) if product.amount < 1
    if @basket.include?(product)
      @basket[product] += 1
    else
      @basket[product] = 1
    end
    @sum_price += product.price
    return product
  end

  def check_input(user_input)
    @user_input = user_input
    until @user_input < @products.to_a.size
      puts "Такого товара нет. Выберите другой."
      @user_input = STDIN.gets.to_i - 1
    end
    return @user_input
  end

  def purchases
    @basket.each_pair { |product, count| puts "#{count} шт. - #{product}" }
  end
end