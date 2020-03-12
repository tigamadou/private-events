require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
    let!(:user) do
        User.create(
                    username: 'amadou',
                    email: 'amadou@gmail.com',
                    password: '123456',
                    password_confirmation: '123456')
      end
    
      describe 'Sign in the user' do
        before do
          visit sign_in_path
        end
    
        it 'shows login form' do
          have_link 'Sign in', href: sign_in_path
          have_link 'Sign Up', href: user_new_path          
          expect(page).to have_content('Sign Up')
        end

        it 'logs in the user ' do
            fill_in 'Username', with: user.username
            click_button 'Sign In'
            expect(page).to have_content("Hello #{user.username}!")
            expect(current_path).to eq user_path(user)         
            have_link 'Sign Out', href: sign_out_path
            expect(page).to have_text 'My Events'
            expect(page).to have_text 'Upcoming Events'
            expect(page).to have_text 'Past Events'
        end
        
        it 'Show error for wrong credentials' do
            fill_in 'Username', with: "juda"
            click_button 'Sign In'
            expect(page).to have_content("Sign Up")
            expect(current_path).to eq sign_in_path      
            have_link 'Sign in', href: sign_in_path
            have_link 'Sign Up', href: user_new_path    
          
        end
       
      end
    
     
end