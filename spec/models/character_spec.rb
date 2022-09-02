# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character, type: :model do
  context 'valid factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  context 'with valid association' do
    it { should belong_to(:user) }
    it { should have_many(:movies).through(:movie_characters) }
  end

  describe 'validation' do
    it { should validate_presence_of(:image).with_message('Required') }

    it { should validate_presence_of(:name).with_message('Required') }
    it { should validate_uniqueness_of(:name).with_message('Has already been taken') }
    it {
      should validate_length_of(:name)
        .is_at_least(3)
        .is_at_most(20)
        .with_message('Minimum 3 and maximum 20 characters')
    }

    it {
      should validate_numericality_of(:age)
        .is_greater_than(0)
        .is_less_than_or_equal_to(999)
        .with_message('Invalid age must be between 1 and 3 digits')
    }

    it {
      should validate_numericality_of(:weight)
        .is_greater_than(0)
        .is_less_than_or_equal_to(999)
        .with_message('Invalid weight must be between 1 and 3 digits')
    }

    it { should validate_presence_of(:history).with_message('Required') }
    it {
      should validate_length_of(:history)
        .is_at_least(20)
        .is_at_most(2000)
        .with_message('Minimum 20 and maximum 2000 characters')
    }
  end
end
