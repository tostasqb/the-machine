class Vending
  class << self
    def call(coins, product_id)
      ActiveRecord::Base.transaction do
        insert_coins(coins)
        return_product(product_id)
        calculate_change(coins, product_id)
      end
    end

    def insert_coins(coins)
      coins.each do |coin|
        rec = Coin.find_by(value: coin)
        rec.quantity += 1
        rec.save
      end
    end

    def return_product(product_id)
      product = Product.find(product_id)
      product.quantity -= 1
      product.quantity_sold += 1

      product.save!
    end

    def calculate_change(coins_inserted, product_id)
      # needed BD data
      product = Product.find(product_id)

      # all floats
      coins_inserted = coins_inserted.map(&:to_f)
      product_price = product.price.to_f

      # calculate difference
      difference = coins_inserted.sum - product_price

      # and finally get all available coins
      change = []
      while difference > 0
        coin_to_return = Coin.where('quantity > 0 and value <= ?', difference).order(value: :desc).first

        raise "Not possible to give change, sorry!" if coin_to_return.blank?

        change << coin_to_return.value.to_f
        difference -= coin_to_return.value.to_f
        difference = difference.round(2) # remove possible decimal problems
        coin_to_return.quantity -= 1
        coin_to_return.save
      end

      change
    end
  end
end