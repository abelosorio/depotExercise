class LineItem < ActiveRecord::Base
  # Field product and cart are children of rows in the carts and products
  # tables.
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end
end
