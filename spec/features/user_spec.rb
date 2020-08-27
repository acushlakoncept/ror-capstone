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

  it 'allows case insensitivity for authentication' do
    visit login_path
    fill_in 'session_username', with: 'ACUSHLA'
    click_button 'Login'
    expect(current_path).to eq(root_path)
    expect(page).to have_http_status(200)
  end
end

describe 'Authenticated User Activities', type: :feature do
  before :each do
    @user1 = User.create(username: 'acushla', fullname: 'Uduak Essien')
    @user2 = User.create(username: 'faith', fullname: 'Faith Essien')
    visit '/login'
    fill_in 'session_username', with: 'acushla'
    click_button 'Login'
  end

  it 'visits user profile page' do
    visit profile_path(@user1.username)
    expect(page).to have_current_path('/users/acushla')
    expect(page).to have_text('TWEET TO UDUAK ESSIEN')
  end

  it 'accesses another user path' do
    visit '/users/faith'
    expect(page).to have_http_status(:success)
    expect(page).to have_text('TWEET TO FAITH ESSIEN')
  end

  it 'follows a user' do
    visit '/users/faith'
    expect(page).to have_text('0 Following')
    find('a.follow_me').click
    expect(page).to have_text('1 Following')
  end

  it 'logs out a user' do
    click_link 'Log out'
    expect(current_path).to eq(login_path)
  end
end
