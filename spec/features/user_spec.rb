require 'rails_helper'

describe 'Authentication', type: :feature do
  before :each do
    User.create(username: 'acushla', fullname: 'Uduak Essien')
  end

  it 'signs @user in to access index page' do
    visit login_path
    fill_in 'session_username', with: 'acushla'
    click_button 'Login'
    expect(current_path).to eq(root_path)
  end

  it 'does not sign in with wrong info' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'mypassword'
    click_button 'Log in'
    expect(page).to have_text('Invalid Email or password.')
  end
end
