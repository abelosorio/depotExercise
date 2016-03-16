class StoreController < ApplicationController
  def index
    @products = Product.order(:title)

    # Count user access to our Store. The count will be restarted when user
    # clicks on "Add to cart" button.
    # Served to view as @total_user_access variable.
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    @total_user_access = session[:counter]
  end

end
