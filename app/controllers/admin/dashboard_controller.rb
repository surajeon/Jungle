class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :name => ENV['SOME_USER'], :password => ENV['SOME_PASS']

  def show
    @products = Product.count
  end
end
