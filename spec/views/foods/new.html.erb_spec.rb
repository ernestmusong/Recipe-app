require 'rails_helper'

RSpec.describe 'foods/new', type: :view do
  before(:each) do
    assign(:food, Food.new(
                    name: 'chiken',
                    measurement_unit: 'gram',
                    price: 1,
                    quantity: 1,
                    user_id: 1
                  ))
  end

  it 'renders new food form' do
    render

    assert_select 'form[action=?][method=?]', foods_path, 'post' do
      assert_select 'input[name=?]', 'food[name]'

      assert_select 'input[name=?]', 'food[measurement_unit]'

      assert_select 'input[name=?]', 'food[price]'

      assert_select 'input[name=?]', 'food[quantity]'

      assert_select 'input[name=?]', 'food[user_id]'
    end
  end
end
