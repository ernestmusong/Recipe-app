class ShoppingListsController < ApplicationController
  def index
    @foods = Food.all
   end
end
