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
