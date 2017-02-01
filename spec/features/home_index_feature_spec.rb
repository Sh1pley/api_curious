require 'rails_helper'

describe 'root path' do
  let!(:user) {create(:user)}
  
  it 'asks user to log in' do
    visit root_path

    expect(current_path).to eq('/')
    expect(page).to_not have_selector(".welcome")
  end

  it 'welcomes logged in user' do
    page.set_rack_session(:user_id => user.id)
    visit root_path
    
    expect(page).to have_selector(".welcome")
    expect(page).to have_content("#{user.username}")
  end

  it 'can logout to the root path' do
    page.set_rack_session(:user_id => user.id)
    visit root_path
    click_on("Logout")

    expect(current_path).to eq('/')
  end

end