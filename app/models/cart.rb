class Cart < ActiveRecord::Base
  # A cart (potentially) has many associated line items.
  # The dependent: :destroy part indicates that the existence of line items is
  # dependent on the existence of the cart.
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    # The find_by() method is a streamlined version of the where() method.
    # Instead of returning an array of results, it returns either an existing
    # LineItem or nil.
    current_item = line_items.find_by(product_id: product_id)
    # Remember: nil evaluates to false.
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end

    # This is the same as 'return current_item'
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
