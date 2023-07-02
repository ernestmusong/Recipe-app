require 'rails_helper'

RSpec.describe Food, type: :model do
  before :all do
    @first_user = User.create(name: 'Musong')
    @first_food = Food.create(name: 'Egusi', measurement_unit: 'kg', user: @first_user)
  end

  after :all do
    User.destroy_all
    Food.destroy_all
  end

  describe '#Validations' do
    it 'Food name  must not be nil' do
      @first_food.name = nil
      expect(@first_food).not_to be_valid
    end

    it 'Food price must not be greater than 0 ' do
      @first_food.price = 0
      expect(@first_food).not_to be_valid
    end

    it 'Food measurement unit must not be nil ' do
      @first_food.measurement_unit = nil
      expect(@first_food).not_to be_valid
    end
  end
end
