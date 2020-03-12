require 'rails_helper'

RSpec.feature "EventsManagments", type: :feature do
  
  let!(:user) do
    User.create(
                username: 'amadou',
                email: 'amadou@gmail.com',
                password: '123456',
                password_confirmation: '123456')
  end
  
  let!(:event) do
    Event.create(
                name: 'Test Event',
                description: 'A simple description',
                date: '2020/05/25',
                venue: 'White house')
  end

  scenario 'Event creation', type: :feature do
    visit visit sign_in_path
    fill_in 'Username', with: user.username
    click_button 'Sign In'
    click_on 'Events'
    expect(current_path).to eq events_path
    click_on 'Create a new event'
    expect(current_path).to eq new_event_path
    page.fill_in 'Name', with: event.name
    page.fill_in 'Description', with: event.description
    page.fill_in 'Date', with: event.date
    page.fill_in 'Venue', with: event.venue
    click_button 'Create Event'
    expect(page).to have_text 'Event created!'
    expect(page).to have_text event.name
  end


end
