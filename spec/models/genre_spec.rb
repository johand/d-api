# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do
  context 'valid factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  context 'with valid association' do
    it { should belong_to(:user) }
    it { should have_many(:movies).through(:movie_genres) }
  end

  describe 'validation' do
    it { should validate_presence_of(:name).with_message('Required') }
    it { should validate_uniqueness_of(:name).with_message('Has already been taken') }
    it {
      should validate_length_of(:name)
        .is_at_least(3)
        .is_at_most(20)
        .with_message('Minimum 3 and maximum 20 characters')
    }

    it { should validate_presence_of(:image).with_message('Required') }
  end
end
