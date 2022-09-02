# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'valid factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  context 'with valid association' do
    it { should belong_to(:user) }
    it { should have_many(:characters).through(:movie_characters) }
    it { should have_many(:genres).through(:movie_genres) }
  end

  describe 'validation' do
    it { should validate_presence_of(:image).with_message('Required') }
    it { should validate_presence_of(:title).with_message('Required') }
    it { should validate_uniqueness_of(:title).with_message('Has already been taken') }
    it { should validate_presence_of(:date).with_message('Required') }
    it {
      should validate_numericality_of(:qualification)
        .is_greater_than(0)
        .is_less_than_or_equal_to(5)
        .with_message('Invalid qualification must be between 1 and 5 points')
    }
  end
end
