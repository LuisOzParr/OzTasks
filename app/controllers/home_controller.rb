class HomeController < ApplicationController
  def index
    @users = User.all
    @user = User.first
  end
end