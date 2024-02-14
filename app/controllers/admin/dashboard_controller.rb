class Admin::DashboardController < ApplicationController
  def show
  @productsCount = Product.all.count
  @categoriesCount = Category.all.count
  end
end
