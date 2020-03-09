require 'rails_helper'
 
RSpec.describe 'Signing in a user', type: :feature do
  scenario 'valid user' do
    user = User.create(username: 'JohnDoe', email: 'johndoe@ymail.com', password: 'password')
    visit sign_in_path
    fill_in 'Username', with: 'JohnDoe'
    click_on 'Sign In'
    visit user_path(user)
    expect(page).to have_content('JohnDoe')
  end
end