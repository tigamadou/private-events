require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { Event.new(name: 'Birthdat Party', description: 'Simple Description', date: '2020-03-06',venue:'White House')}

  context 'it has name, description, date and venue' do
    it 'has to have a name' do
      expect(event.name).to eq('Birthdat Party')
    end
  
    it 'it has to have a description' do
      expect(event.description).to eq('Simple Description')
    end
  
    it 'it has to have a date' do
      expect(event.date).to eq('2020-03-06')
    end

    it 'it has to have a venue' do
      expect(event.venue).to eq('White House')
    end

  end
  
  context 'it has to return an error for missing fields' do
    it 'returns an error for missing name' do
      event.name = nil
      expect(event.save).to eq(false)
    end

    it 'returns an error for missing description' do
      event.description = nil
      expect(event.save).to eq(false)
    end

    it 'returns an error for missing date' do
      event.date = nil
      expect(event.save).to eq(false)
    end

    it 'returns an error for missing venue' do
      event.venue = nil
      expect(event.save).to eq(false)
    end

  end

  context 'It has Associations' do
    it { should belong_to(:creator) }
    it { should have_many(:event_attendees) }
  end
end
