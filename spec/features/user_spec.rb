require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test@gmail.com', password: '123', password_confirmation: '123456',
                        confirmation_token: nil)
  end
  describe 'sign in page' do
    scenario 'should have a sign in page' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end
    scenario 'should have a sign in form' do
      visit new_user_session_path
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end
    scenario 'should have a sign in button' do
      visit new_user_session_path
      expect(page).to have_button('Log in')
    end
    scenario 'should have a sign up link' do
      visit new_user_session_path
      expect(page).to have_link('Sign up')
    end
    scenario 'should have a forgot password link' do
      visit new_user_session_path
      expect(page).to have_link('Forgot your password?')
    end
    scenario 'when user signs in with valid credential it will redirect to recipe page' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully')
    end
    scenario 'when user signs in with invalid credential it will redirect to sign in page' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Log in')
    end
    scenario 'when user clicks on forgot password link it will redirect to forgot password page' do
      visit new_user_session_path
      click_link 'Forgot your password?'
      expect(page).to have_content('Forgot your password?')
    end
  end
  describe 'sign up page' do
    scenario 'should have a sign up form' do
      visit new_user_registration_path
      expect(page).to have_content('Name')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Password confirmation')
    end
    scenario 'should have a sign up button' do
      visit new_user_registration_path
      expect(page).to have_button('Sign up')
    end
  end
  describe 'forgot password page' do
    it 'should have a forgot password page' do
      visit new_user_password_path
      expect(page).to have_content('Forgot your password?')
    end
    it 'should have a forgot password form' do
      visit new_user_password_path
      expect(page).to have_content('Email')
    end
  end
end
