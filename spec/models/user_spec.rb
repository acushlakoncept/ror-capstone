require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:fullname) }

  it do
    should validate_uniqueness_of(:username)
      .with_message('Username already taken.')
  end

  it do
    should validate_length_of(:username)
      .is_at_most(10)
      .with_message('Maximum allowed username is 10 characters.')
  end

  it do
    should validate_length_of(:fullname)
      .is_at_most(20)
      .with_message('Maximum allowed fullname is 20 characters.')
  end

  it do
    should_not validate_length_of(:username)
      .is_at_least(2)
      .with_message('Minimum allowed characters for username is 3')
  end

  it do
    should_not validate_length_of(:fullname)
      .is_at_least(5)
      .with_message('Minimum allowed characters for fullname is 6')
  end

end
