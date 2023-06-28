class ShoppingListsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @foods = Food.where.not(user_id: @user.id)
  end
end
