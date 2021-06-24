class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['SOME_USER'].to_s, password: ENV['SOME_PASS'].to_s
  def show
  end
end
