require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(180) }
    it { should_not validate_length_of(:text).is_at_least(2) }
  end

  describe 'Associations' do
    it { should belong_to(:author) }
  end
end
