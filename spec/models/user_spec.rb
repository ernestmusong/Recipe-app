require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @first_user = User.create(name: 'Musong')
    @first_user.save
  end

  after :all do
    User.destroy_all
  end

  it "should give the name of user variable's value" do
    puts @first_user.inspect, 'from user spec'
    expect(@first_user.name).to eq('Musong')
  end

  describe 'User Validation checks' do
    it 'Name must not be blank' do
      @first_user.name = nil
      expect(@first_user).not_to be_valid
    end
  end
end
