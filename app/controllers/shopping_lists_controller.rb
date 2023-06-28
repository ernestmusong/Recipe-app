class ShoppingListsController < ApplicationController
  def index
    @users = User.all.includes(:foods)
    @user = User.includes(:foods).find(params[:user_id])
    @foods = Food.where.not(user_id: @user.id).includes(:user)
  end
end
