class Cart < ActiveRecord::Base
  # A cart (potentially) has many associated line items.
  # The dependent: :destroy part indicates that the existence of line items is
  # dependent on the existence of the cart.
  has_many :line_items, dependent: :destroy
end
