require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'JohnDoe', email: 'johndoe@ymail.com', password: 'password') }

  context 'it has username, email and password' do
    it 'has to have a username' do
      expect(user.username).to eq('JohnDoe')
    end

    it 'it has to have an email' do
      expect(user.email).to eq('johndoe@ymail.com')
    end

    it 'it has to have a password' do
      expect(user.password).to eq('password')
    end
  end

  context 'it has to return an error for missing fields' do
    it 'returns an error for missing username' do
      user.username = nil
      expect(user.save).to eq(false)
    end

    it 'returns an error for missing email' do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it 'returns an error for missing password' do
      user.password = nil
      expect(user.save).to eq(false)
    end
  end

  context 'It has Associations' do
    it { should have_many(:event) }
    it { should have_many(:event_attendees) }
  end
end
