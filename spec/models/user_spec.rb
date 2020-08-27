require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'User validations' do
    it do
      should validate_presence_of(:username)
        .with_message('Username cannot be blank')
    end
    it { should_not validate_length_of(:username).is_at_least(2) }
    it { should_not validate_length_of(:username).is_at_most(11) }
    it { should validate_uniqueness_of(:username).case_insensitive.with_message("Username already taken.")}

    it do
      should validate_presence_of(:fullname)
        .with_message('FullName cannot be blank')
    end
    
    it do
      should validate_length_of(:fullname)
        .is_at_most(20)
        .with_message('Maximum allowed fullname is 20 characters.')
    end
  end

  describe 'Model Associations' do
    it { should have_many(:expenses).with_foreign_key(:author_id) }
    it { should have_many(:groups).with_foreign_key(:author_id) }
    it { should have_many(:expenses).dependent(:destroy) }
  end

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

