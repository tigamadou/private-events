require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  let(:event_attendee) { EventAttendee.new(user_id: 1, event_id: 1)}

  context 'it has user_id and event_id' do
    it 'has to have a user_id' do
      expect(event_attendee.user_id).to eq(1)
    end
  
    it 'it has to have a event_id' do
      expect(event_attendee.event_id).to eq(1)
    end   

  end
  
  context 'it has to return an error for missing fields' do
    it 'returns an error for missing user_id' do
      event_attendee.user_id = nil
      expect(event_attendee.save).to eq(false)
    end

    it 'returns an error for missing event_id' do
      event_attendee.event_id = nil
      expect(event_attendee.save).to eq(false)
    end
  end

  context 'It has Associations' do
    it { should belong_to( :attendee).class_name('User') }
    it { should belong_to(:attended_event).class_name('Event') }
  end
end
