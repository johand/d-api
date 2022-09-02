# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'valid factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  context 'with valid association' do
    it { should have_many(:movies) }
    it { should have_many(:characters) }
    it { should have_many(:genres) }
  end

  describe 'validations' do
    it {
      should validate_presence_of(:username)
        .with_message('You must add a username')
    }

    it {
      should validate_uniqueness_of(:username)
        .with_message('This username has already exists')
    }

    it {
      should validate_length_of(:username)
        .is_at_least(5)
        .with_message('Must be minimum 5 characters')
    }

    it {
      should validate_length_of(:username)
        .is_at_most(20)
        .with_message('Must be maximum 20 characters')
    }

    it {
      should validate_presence_of(:email).with_message('You must add a email')
    }

    it {
      should validate_uniqueness_of(:email)
        .ignoring_case_sensitivity
        .with_message('This email has already exists')
    }

    it {
      should validate_presence_of(:password).with_message('Required')
    }

    it {
      should validate_confirmation_of(:password)
        .with_message('The passwords do not match')
    }
  end
end
